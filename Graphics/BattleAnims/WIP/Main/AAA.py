# Animation Assemble All. Runs AA to generate animation installer.
# Also generates battle anim palettes from .pal file.
# .pal file should have:
#   - 128 bytes representing four enemy ghost palettes.
#   - 128 bytes representing four enemy human palettes.
#   - 128 bytes representing four neutral human palettes.
#
# Made by Huichelaar. This is mostly intended for personal use.
# If you want to use it yourself, you'll probably have to change stuff.
# Atm it's very specifically useful for my needs.
#
# Massive thanks to circleseverywhere for the amazing Animation Assembler.
import os
import PaletteDict as palDict
import lzss
from shutil import copyfile

def b_to_hex(data):
  '''Takes a bytes object and returns BYTE AA BB CC DD'''
  return 'BYTE ' + ' '.join([hex(x) for x in data])

# Create a pal.event file containing palettes for the battle anim in directory.
def createPalette(dir):
  zeroPal = b'\x00'*32
  
  # Only consider directories containing a pal.dmp file.
  inputPal = dir+"\\pal.txt"
  outputPal = dir+"\\pal.event"
  if os.path.isfile(inputPal):
    
    # Don't redo palette if it's not been modified
    if (not os.path.isfile(outputPal) or os.path.getmtime(inputPal) > os.path.getmtime(outputPal)):
      input = open(inputPal, 'r')
      lines = input.readlines()
      
      # Don't create palette if not exactly 16 colours have been specified.
      if len(lines) != 16:
        input.close()
        print(inputPal+" doesn't contain exactly 16 colours (17 lines)! No pal.event generated.\n")
        return
      
      # Don't create palette if at least one colour isn't in dictionary.
      for line in lines:
        if line[:-1] not in palDict.dict[0]:
          input.close()
          print(inputPal+" Uses palette colour: "+line[:-1]+" not in PaletteDict! No pal.event generated.\n")
          return
          
      # Build 12 palettes. 4 ghost, 4 human. Humans use two palettes.
      output = open(outputPal, 'w')
      for i in range(8):
        pal = zeroPal
        for line in lines:
          pal += palDict.dict[i][line[:-1]]
        if i > 3:   # Human.
          form = "H"
          for line in lines:
            pal += palDict.dict[i+4][line[:-1]]
        else:       # Ghost.
          form = "G"
          pal += zeroPal
        pal += zeroPal
        compPal = lzss.compress(pal)
        outputText = """ALIGN 4; Anim_{form}{version}_{classname}_pal:\n{compPal}\n\n"""
        output.write(outputText.format(classname=dir, compPal=b_to_hex(compPal), form=form, version=(i&3)+1))
      
      input.close()
      output.close()
      

def main():
  output = open("BattleAnims.event", 'w')

  # Iterate over all class directories.
  for classID in next(os.walk('.'))[1]:
    cwd = os.getcwd()
    subdirs = next(os.walk('.'+'\\'+classID))[1]
    classdir = cwd+'\\'+classID+'\\'
    
    createPalette(classID)

    # Create anim installers.
    anim = False
    for subdir in subdirs:
      if subdir == "1. Sword" or subdir == "2. Lance" or subdir == "3. Axe" or subdir == "4. Handaxe" or subdir == "5. Bow" or subdir == "6. Magic" or subdir == "7. Staff" or subdir == "8. Unarmed":
        weapondir = classdir+subdir+'\\'
        anim = True
        weaponType = subdir[3:]
        battleAnimBinary = weapondir+weaponType+".bin"
        battleAnimInstaller = weapondir+weaponType+"Installer.event"
        if (not os.path.isfile(battleAnimInstaller) or os.path.getmtime(battleAnimBinary) > os.path.getmtime(battleAnimInstaller)):
          copyfile(cwd+"\\AA.py", weapondir+"AA.py")
          copyfile(cwd+"\\lzss.py", weapondir+"lzss.py")
          os.chdir(weapondir)
          os.system("python \""+weapondir+"AA.py\" "+"\""+battleAnimBinary+"\" "+classID)
          os.chdir(cwd)
          os.remove(weapondir+"AA.py")
          os.remove(weapondir+"lzss.py")
          
        
        output.write("#include \""+classID+"/"+subdir+"/"+weaponType+"Installer.event\n")
    if anim:
      output.write("#include \""+classID+"/"+"pal.event\n\n")
    anim = False
  
  output.close()
  
if __name__ == '__main__':
    main()