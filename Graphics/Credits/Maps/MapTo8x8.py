# Maps a 64x64 tiled map with 16x16 tiles to an 8x8 tileset.
# I use this to create M7 maps for the credits without having to use 8x8 tiles.
import csv
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-i', default="Fields8x8to16x16.csv", help='Input 16x16 tilemap using 8x8 tileset. Default is Fields8x8to16x16.csv')
parser.add_argument('-j', default="Fields16x16toMap.csv", help='Input map using 16x16 tileset. Default is Fields16x16toMap.csv')
parser.add_argument('-k', default="FieldsTilesUpper.dmp", help='Input tiles used by BG2. Default is FieldsTilesUpper.dmp')
parser.add_argument('-l', default="FieldsTilesLower.dmp", help='Input tiles used by BG3. Default is FieldsTilesLower.dmp')
parser.add_argument('-o', default="FieldsBG.dmp", help='Output BG VRAM. Default is FieldsBG.dmp')
args = parser.parse_args()

tileMap = [[0]*64 for i in range(64)]           # Maps 8x8 tiles to 16x16 tiles.
map = [[0]*64 for i in range(64)]               # Maps 16x16 tiles to the actual map.
tileMapMap = [[0]*128 for i in range(128)]      # Maps 8x8 tiles to the actual map.

csvfile = open(args.i, newline='')
reader = csv.reader(csvfile, delimiter=',', quotechar='|')
for i, row in enumerate(reader):
    tileMap[i] = [int(row[j]) for j in range(len(row))]
csvfile.close()

csvfile = open(args.j, newline='')
reader = csv.reader(csvfile, delimiter=',', quotechar='|')
for i, row in enumerate(reader):
    map[i] = [int(row[j]) for j in range(len(row))]
csvfile.close()

for i in range(64):
    for j in range(64):
        row = (map[i][j] >> 5)
        col = (map[i][j] & 0x1F)
        tileMapMap[i*2][j*2] = tileMap[row*2][col*2]
        tileMapMap[i*2][j*2+1] = tileMap[row*2][col*2+1]
        tileMapMap[i*2+1][j*2] = tileMap[row*2+1][col*2]
        tileMapMap[i*2+1][j*2+1] = tileMap[row*2+1][col*2+1]


tileMapMapUpper = [[0 if tileMapMap[i][j] > 0xFF else tileMapMap[i][j] for j in range(128)] for i in range(128)]
tileMapMapLower = [[0 if tileMapMap[i][j] <= 0xFF else tileMapMap[i][j] & 0xFF for j in range(128)] for i in range(128)]


output = open(args.o, "wb")

# BG2 char entries
input = open(args.k, "rb")
output.write(input.read())

# BG2 screen entries
for i in tileMapMapUpper:
    for j in i:
        output.write(j.to_bytes(1, byteorder='little', signed=False))

# BG3 char entries
input = open(args.l, "rb")
output.write(input.read())

# BG3 screen entries
for i in tileMapMapLower:
    for j in i:
        output.write(j.to_bytes(1, byteorder='little', signed=False))
        
output.close()