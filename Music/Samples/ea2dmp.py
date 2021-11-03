# I made this to convert Sample EA files to .dmp.
# Shouldn't need this anymore as I convert .wav to .dmp directly now.
# Drag'n'drop .s onto s2dmp.bat for ease of use.
# Input:    <filename>.s
# Output:   <filename>.dmp
#
# Made by Huichelaar.
# Many thanks to Alusq & Bregalad.

import argparse

def readWord(inputFile):
    return ord(inputFile.read(1)) | (ord(inputFile.read(1)) << 8) | (ord(inputFile.read(1)) << 16) | (ord(inputFile.read(1)) << 32)

parser = argparse.ArgumentParser()
parser.add_argument('-i', default="Sample.event", help='Input EA file. default is Sample.event')
parser.add_argument('-o', default="Sample.dmp", help='Output DMP file. default is Sample.dmp')
args = parser.parse_args()

input = open(args.i, "r")
output = open(args.o, "wb")

lines = input.readlines()


# Header data
loopFlag = int(lines[1].lstrip('\tSHORT '), 16) << 16
frequency = int(lines[2].lstrip('\tWORD\t'), 10)
loop = int(lines[3].lstrip('\tWORD\t'), 10)
size = int(lines[4].lstrip('\tWORD\t'), 10)

output.write(loopFlag.to_bytes(4, byteorder='little', signed=False))
output.write(frequency.to_bytes(4, byteorder='little', signed=False))
output.write(loop.to_bytes(4, byteorder='little', signed=False))
output.write(size.to_bytes(4, byteorder='little', signed=False))

# Sample
i = 7
while lines[i][0] != '\n':
    line = lines[i].lstrip('\tBYTE ').split(' ')
    for j in line:
        output.write(int(j, 16).to_bytes(1, byteorder='little', signed=False))
    i += 1

input.close()
output.close()