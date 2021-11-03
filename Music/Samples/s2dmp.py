# Drag'n'drop .s onto s2dmp.bat for ease of use.
# Input:    <filename>.s
# Output:   <filename>.dmp
#
# Made by Huichelaar.
# Many thanks to Alusq & Bregalad.
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-i', default="Sample.s", help='Input Sappy file. default is Sample.s')
parser.add_argument('-o', default="Sample.dmp", help='Output DMP file. default is Sample.dmp')
args = parser.parse_args()

input = open(args.i, "r")
output = open(args.o, "wb")

lines = input.readlines()

# Header data
loopFlag = int(lines[19].lstrip('\t.short\t'), 16) << 16
frequency = int(lines[20].lstrip('\t.Int\t'), 10)
loop = int(lines[21].lstrip('\t.Int\t'), 10)
size = int(lines[22].lstrip('\t.Int\t'), 10)

output.write(loopFlag.to_bytes(4, byteorder='little', signed=False))
output.write(frequency.to_bytes(4, byteorder='little', signed=False))
output.write(loop.to_bytes(4, byteorder='little', signed=False))
output.write(size.to_bytes(4, byteorder='little', signed=False))

# Sample
i = 25
while lines[i][0] != '\n':
    line = lines[i].lstrip('\t.byte ').split(',')
    for j in line:
        output.write(int(j, 16).to_bytes(1, byteorder='little', signed=False))
    i += 1

input.close()
output.close()