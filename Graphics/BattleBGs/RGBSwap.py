# This script will swap some R G and Bs
#
# Made by Huichelaar.
# Many thanks to Snek's tmx2tsa for working as an argparse example.
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-i', default="ThronePalette.dmp", help='Input palette file.')
parser.add_argument('-o', default="ThronePaletteGreen.dmp", help='Output palette file.')
args = parser.parse_args()


input = open(args.i, "rb")
output = open(args.o, "wb")


# Swap R G and Bs
for i in range(192):

    inputEntry = ord(input.read(1)) | (ord(input.read(1)) << 8)

    red2 = (inputEntry & 31)
    green2 = ((inputEntry >> 5) & 31)
    blue2 = ((inputEntry >> 10) & 31)
    
    red = green2
    green = red2 - 8
    blue = blue2

    if red < 0:
      red = 0
    elif red > 31:
      red = 31
    if green < 0:
      green = 0
    elif green > 31:
      green = 31
    if blue < 0:
      blue = 0
    elif blue > 31:
      blue = 31

    outputEntry = red | (green << 5) | (blue << 10)

    output.write((outputEntry).to_bytes(2, byteorder='little', signed=False))


input.close()
output.close()