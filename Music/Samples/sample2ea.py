# Drag'n'drop .wav onto sample2ea.bat for ease of use.
# Input:    <filename>.wav
# Output:   <filename>.event
#
# Made by Huichelaar.
# Many thanks to Alusq & Bregalad.
import argparse

def readWord(inputFile):
    return ord(inputFile.read(1)) | (ord(inputFile.read(1)) << 8) | (ord(inputFile.read(1)) << 16) | (ord(inputFile.read(1)) << 32)

parser = argparse.ArgumentParser()
parser.add_argument('-i', default="Sample.wav", help='Input WAVE file. default is Sample.wav')
parser.add_argument('-o', default="Sample.event", help='Output EA file. default is Sample.event')
args = parser.parse_args()

input = open(args.i, "rb")

# Check for RIFF-tag
if input.read(4).decode('ascii') != "RIFF":
    print("WAVE doesn't have RIFF tag at the start\nAborting.")
    input.close()
    exit()

output = open(args.o, "w")

# First three bytes are 0.
# Thanks to Bregalad for noting down the sample format.
output.write("BYTE 0 0 0")

# Look for loop info.
wavSize = readWord(input)
input.seek(0x28)
sampleSize = readWord(input)

if wavSize - sampleSize > 36:
    output.write(" 0x40\n")
    val = sampleSize+0x61 & -2          # Address is 2-aligned
    input.seek(val)
    loop = readWord(input)
    input.seek(0x2C + loop)
    interpolation = [ord(input.read(1)) ^ 0x80, ord(input.read(1)) ^ 0x80]
else:
    output.write(" 0\n")
    loop = 0;
    interpolation = [0x80, 0x80];
    print("Couldn't find loop info. Loop not set.")

# Frequency
input.seek(0x18)
frequency = readWord(input)
frequency <<= 10

output.write("WORD " + str(frequency) + "\n")
output.write("WORD " + str(loop) + "\n")
output.write("WORD " + str(sampleSize) + "\n")

input.seek(0x2C)
i = sampleSize
j = 8
while i > 0:
    if j >= 8:
        j = 0
        output.write("\nBYTE")
    output.write(" " + hex(ord(input.read(1)) ^ 0x80))
    i -= 1
    j += 1

# Add interpolation bytes. Should counter clicking noise on loop.
i = 2
k = 0
while i > 0:
    if j >= 8:
        j = 0
        output.write("\nBYTE")
    output.write(" " + hex(interpolation[k]))
    i -= 1
    j += 1
    k += 1

output.write("\n")

input.close()
output.close()