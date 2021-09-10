# Run this to create 64 different palettes
# each containing 1 white colour followed by
# 15 shades of their main colour ordered from dark to light.
# This is achieved by incrementally increasing the hue for each palette.
# The palettes will be APPENDED to ReliefPalettes.dmp in the format that FEGBA should accept.
import colorsys

# Function is a modified version of this one: http://www.herethere.net/~samson/php/color_gradient/color_gradient_generator.php.txt
def interpolate(pBegin, pEnd, pStep, pMax):
    if (pBegin < pEnd):
        return ((pEnd - pBegin) * (pStep / pMax)) + pBegin
    else:
        return ((pBegin - pEnd) * (1 - (pStep / pMax))) + pEnd

# Function taken from martineau's answer: https://stackoverflow.com/questions/54116198/how-to-convert-int-to-hex-and-write-hex-to-file
def int_to_bytes(n, minlen=0):
    """ Convert integer to bytearray with optional minimum length. 
    """
    if n > 0:
        arr = []
        while n:
            n, rem = n >> 8, n & 0xff
            arr.append(rem)
        b = bytearray(reversed(arr))
    elif n == 0:
        b = bytearray(b'\x00')
    else:
        raise ValueError('Only non-negative values supported')

    if minlen > 0 and len(b) < minlen: # zero padding needed?
        b = (minlen-len(b)) * '\x00' + b
    return b

def main():
    steps = 15
    palette = [0 for x in range(steps+1)]
    
    ReliefPal = [0xFF7F, 0x0DA2, 0x0E05, 0x0E04, 0x0E06, 0x0E27, 0x1243, 0x0E69, 0x2288, 0x1AAD, 0x16CC, 0x1AEF, 0x1B51, 0x2FB0, 0x47D6, 0x47D9]
    
    RMask = 0x1F
    GMask = 0x1F << 5
    BMask = 0x1F << 10
    
    gradientR = [ReliefPal[i] & RMask for i in range(len(ReliefPal))]
    gradientG = [(ReliefPal[i] & GMask) >> 5 for i in range(len(ReliefPal))]
    gradientB = [(ReliefPal[i] & BMask) >> 10 for i in range(len(ReliefPal))]
    
    hsv = [colorsys.rgb_to_hsv(gradientR[i], gradientG[i], gradientB[i]) for i in range(len(gradientR))]
    gradient = [colorsys.hsv_to_rgb(hsv[i][0], hsv[i][1], hsv[i][2]) for i in range(len(hsv))]

    f = open("ReliefPalettes.dmp", "ab")
    for i in range(33):
        
        gradientRInt = [int(x[0] + 0.5) for x in gradient]
        gradientGInt = [int(x[1] + 0.5) for x in gradient]
        gradientBInt = [int(x[2] + 0.5) for x in gradient]
        
        # Turn palette into string
        paletteString = ""
        for k in range(len(gradientRInt)):
            palette[k] = hex((gradientRInt[k]) | (gradientGInt[k] << 5) | (gradientBInt[k] << 10))
            
            # Add zeroes if hexdigitcount under four
            colourString = (str(palette[k])[2:6])
            while len(colourString) < 4:
                colourString = "0" + colourString
            
            # Endian BS
            colourString = colourString[2] + colourString[3] + colourString[0] + colourString[1]
            
            paletteString += str(colourString)
        print(paletteString)
        
        # Write palette to file
        paletteHex = int(paletteString, 16)
        f.write(int_to_bytes(paletteHex))
        
        # Shift hue
        hsv = [colorsys.rgb_to_hsv(gradient[j][0], gradient[j][1], gradient[j][2]) for j in range(len(gradient))]
        hue = [hsv[j][0] - 1/33 for j in range(len(hsv))]
        gradient = [colorsys.hsv_to_rgb(hue[j], hsv[j][1], hsv[j][2]) for j in range(len(hue))]
        
    f.close()
            
main()
