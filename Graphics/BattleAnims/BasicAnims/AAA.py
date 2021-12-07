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

outputText = """///////Animation Install.event///////
PUSH
AnimTableEntry({animName}) // Animation slot.
WORD 0 0 0 //empty name field, who cares.
WORD 0x{pointers[0]} 0x{pointers[1]} 0x{pointers[2]} 0x{pointers[3]}
POIN Anim_H1_{classID}_pal

AnimTableEntry({animName}+1) // Animation slot.
WORD 0 0 0 //empty name field, who cares.
WORD 0x{pointers[0]} 0x{pointers[1]} 0x{pointers[2]} 0x{pointers[3]}
POIN Anim_H2_{classID}_pal

AnimTableEntry({animName}+2) // Animation slot.
WORD 0 0 0 //empty name field, who cares.
WORD 0x{pointers[0]} 0x{pointers[1]} 0x{pointers[2]} 0x{pointers[3]}
POIN Anim_H3_{classID}_pal

AnimTableEntry({animName}+3) // Animation slot.
WORD 0 0 0 //empty name field, who cares.
WORD 0x{pointers[0]} 0x{pointers[1]} 0x{pointers[2]} 0x{pointers[3]}
POIN Anim_H4_{classID}_pal

AnimTableEntry({animName}+4) // Animation slot.
WORD 0 0 0 //empty name field, who cares.
WORD 0x{pointers[0]} 0x{pointers[1]} 0x{pointers[2]} 0x{pointers[3]}
POIN Anim_G1_{classID}_pal

AnimTableEntry({animName}+5) // Animation slot.
WORD 0 0 0 //empty name field, who cares.
WORD 0x{pointers[0]} 0x{pointers[1]} 0x{pointers[2]} 0x{pointers[3]}
POIN Anim_G2_{classID}_pal

AnimTableEntry({animName}+6) // Animation slot.
WORD 0 0 0 //empty name field, who cares.
WORD 0x{pointers[0]} 0x{pointers[1]} 0x{pointers[2]} 0x{pointers[3]}
POIN Anim_G3_{classID}_pal

AnimTableEntry({animName}+7) // Animation slot.
WORD 0 0 0 //empty name field, who cares.
WORD 0x{pointers[0]} 0x{pointers[1]} 0x{pointers[2]} 0x{pointers[3]}
POIN Anim_G4_{classID}_pal
POP
"""

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
      
def createAnim(classID, output):
  cwd = os.getcwd()
  subdirs = next(os.walk('.'+'\\'+classID))[1]
  classdir = cwd+'\\'+classID+'\\'
  
  # Create anim installers.
  vanSet = {"sw", "la", "ax", "ha", "bo", "ma", "st", "un"}
  vanDict = {"sw": "Sword", "la": "Lance", "ax": "Axe", "ha": "Handaxe", "bo": "Bow", "ma": "Magic", "st": "Staff", "un": "Unarmed"}
  dirSet = {"1. Sword", "2. Lance", "3. Axe", "4. Handaxe", "5. Bow", "6. Magic", "7. Staff", "8. Unarmed"}
  animDir = False
  anims = []
  for subdir in subdirs:
    if subdir in dirSet:
      animDir = True
      break
  
  # Non-vanilla anims.
  if animDir:
    for subdir in subdirs:
      if subdir in dirSet:
        weapondir = classdir+subdir+'\\'
        animDir = True
        weaponType = subdir[3:]
        anims.append(weaponType)
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
  
  # Vanilla anims.
  elif os.path.isfile(classdir+"vanilla.txt"):
    inputFile = classdir+"vanilla.txt"
    input = open(inputFile, 'r')
    lines = input.readlines()
    for i in range(0, len(lines), 5):
      weaponType = vanDict[lines[i][:-1]]
      anims.append(weaponType)
      animName = classID+weaponType+"Anim"
      pointers = [lines[i+j+1][:-1] for j in range(4)]
      installerFile = classdir+weaponType+"Installer.event"
      if lines[i][:-1] in vanSet:
        if not os.path.isfile(installerFile) or os.path.getmtime(inputFile) > os.path.getmtime(installerFile):
          output2 = open(installerFile, 'w')
          output2.write(outputText.format(animName=animName,classID=classID,pointers=pointers))
          output2.close()
        output.write("#include \""+classID+"/"+weaponType+"Installer.event\"\n")
  
  # No non-vanilla nor vanilla anims.
  else:
    return
  
  # Either non-vanilla or vanilla anims.
  output.write("#include \""+classID+"/"+"pal.event\n")
  output.write("ALIGN 4; "+classID+"Anims:\n")
  for anim in anims:
    output.write(anim+"Anim("+classID+anim+"Anim)\n")
  output.write("EndAnim\n\n")
  
def main():
  output = open("BattleAnims.event", 'w')
  output.write("//File generated by AAA.py\n\n")

  # Iterate over all class directories.
  for classID in next(os.walk('.'))[1]:
    createPalette(classID)
    createAnim(classID, output)
  
  output.close()
  
if __name__ == '__main__':
    main()