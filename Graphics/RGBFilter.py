# Add a filter to a palette
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-i', default="Palette.dmp", help='Input tileset palette file. default is Palette.dmp')
parser.add_argument('-o', default="Palette2.dmp", help='Output tileset palette file. default is Palette2.dmp')
parser.add_argument('-r', default=4, type=int, help='Red value modifier, [-31, 31]. Default is 4')
parser.add_argument('-g', default=-16, type=int, help='Green value modifier, [-31, 31]. Default is -16')
parser.add_argument('-b', default=-16, type=int, help='Blue value modifier, [-31, 31]. Default is -16')
args = parser.parse_args()


input = open(args.i, "rb")
output = open(args.o, "wb")


# Add these values to each colour's R G and B.
redModifier = args.r
greenModifier = args.g
blueModifier = args.b


# Modify colours and concatenate.
for i in range(16):

    inputEntry = ord(input.read(1)) | (ord(input.read(1)) << 8)

    red = (inputEntry & 31) + redModifier
    green = ((inputEntry >> 5) & 31) + greenModifier
    blue = ((inputEntry >> 10) & 31) + blueModifier

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