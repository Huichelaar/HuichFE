# Drag'n'drop .wav onto wav2dmp.bat for ease of use.
# Input:    <filename>.wav
# Output:   <filename>.dmp
#
# Made by Huichelaar.
# Many thanks to Alusq & Bregalad.
import argparse

def readWord(inputFile):
    return ord(inputFile.read(1)) | (ord(inputFile.read(1)) << 8) | (ord(inputFile.read(1)) << 16) | (ord(inputFile.read(1)) << 32)

parser = argparse.ArgumentParser()
parser.add_argument('-i', default="Sample.wav", help='Input WAVE file. default is Sample.wav')
parser.add_argument('-o', default="Sample.dmp", help='Output DMP file. default is Sample.dmp')
args = parser.parse_args()

input = open(args.i, "rb")

# Check for RIFF-tag
if input.read(4).decode('ascii') != "RIFF":
    print("WAVE doesn't have RIFF tag at the start\nAborting.")
    input.close()
    exit()

output = open(args.o, "wb")

# First three bytes are 0.
# Thanks to Bregalad for noting down the sample format.
output.write((0).to_bytes(3, byteorder='little', signed=False))

# Look for loop info.
wavSize = readWord(input)
input.seek(0x28)
sampleSize = readWord(input)

if wavSize - sampleSize > 36:
    val = sampleSize+0x31 & -2
    input.seek(val)
    val = readWord(input)
    if val == 0x3C:
        val = sampleSize+0x61 & -2          # Address is 2-aligned
        input.seek(val)
        output.write((0x40).to_bytes(1, byteorder='little', signed=False))
        loop = readWord(input)
        input.seek(0x2C + loop)
        interpolation = [ord(input.read(1)) ^ 0x80, ord(input.read(1)) ^ 0x80]
    else:
        output.write((0).to_bytes(1, byteorder='little', signed=False))
        loop = 0;
        interpolation = [0x80, 0x80];
        print("  Couldn't find loop info. Loop not set.")
else:
    output.write((0).to_bytes(1, byteorder='little', signed=False))
    loop = 0;
    interpolation = [0x80, 0x80];
    print("  Couldn't find loop info. Loop not set.")

# Frequency
input.seek(0x18)
frequency = readWord(input)
frequency <<= 10

output.write((frequency).to_bytes(4, byteorder='little', signed=False))
output.write((loop).to_bytes(4, byteorder='little', signed=False))
output.write((sampleSize).to_bytes(4, byteorder='little', signed=False))

input.seek(0x2C)
i = sampleSize
while i > 0:
    output.write((ord(input.read(1)) ^ 0x80).to_bytes(1, byteorder='little', signed=False))
    i -= 1


# Add interpolation bytes. Should counter clicking noise on loop.
i = 2
k = 0
while i > 0:
    output.write((interpolation[k]).to_bytes(1, byteorder='little', signed=False))
    i -= 1
    k += 1

input.close()
output.close()