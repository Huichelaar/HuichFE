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
import lzss
from shutil import copyfile

def b_to_hex(data):
  '''Takes a bytes object and returns BYTE AA BB CC DD'''
  return 'BYTE ' + ' '.join([hex(x) for x in data])

# Create a pal.event file containing palettes for the battle anim in directory.
def createPalette(dir):
  zeroPal = b'\x00'*32
  
  # Only consider directories containing a pal.dmp file.
  inputPal = dir+"\\pal.dmp"
  outputPal = dir+"\\pal.event"
  if os.path.isfile(inputPal):
    # Don't redo palette if it's not been modified
    if (not os.path.isfile(outputPal) or os.path.getmtime(inputPal) > os.path.getmtime(outputPal)):
      input = open(inputPal, 'rb')
      output = open(outputPal, 'w')
      
      # Ghost enemy palettes.
      form = "G"
      for i in range(4):
        compPal = lzss.compress(zeroPal+input.read(32)+zeroPal+zeroPal)
        outputText = """ALIGN 4; Anim_{form}{version}_{classname}_pal:\n{compPal}\n\n"""
        output.write(outputText.format(classname=dir, compPal=b_to_hex(compPal), form=form, version=i+1))
      
      # Human enemy and neutral palettes.
      form = "H"
      for i in range(4):
        compPal = lzss.compress(zeroPal+input.read(64)+zeroPal)
        outputText = """ALIGN 4; Anim_{form}{version}_{classname}_pal:\n{compPal}\n\n"""
        output.write(outputText.format(classname=dir, compPal=b_to_hex(compPal), form=form, version=i+1))
        
      input.close()
      output.close()

def main():

  # Iterate over all class directories.
  for dir in next(os.walk('.'))[1]:
    cwd = os.getcwd()
    subdirs = next(os.walk('.'+'\\'+dir))[1]
    classdir = cwd+'\\'+dir
    
    createPalette(classdir)
    
    # Create anim installers.
    for subdir in subdirs:
      if subdir == "1. Sword" or subdir == "2. Lance" or subdir == "3. Axe" or subdir == "4. Handaxe" or subdir == "5. Bow" or subdir == "6. Magic" or subdir == "7. Staff" or subdir == "8. Unarmed":
        battleAnimBinary = classdir+'\\'+subdir+'\\'+subdir[3:]+".bin"
        battleAnimInstaller = classdir+'\\'+subdir[3:]+"Installer.event"
        if (not os.path.isfile(battleAnimInstaller) or os.path.getmtime(battleAnimBinary) > os.path.getmtime(battleAnimInstaller)):
          copyfile(cwd+"\\AA.py", classdir+"\\"+subdir+"\\AA.py")
          copyfile(cwd+"\\lzss.py", classdir+"\\"+subdir+"\\lzss.py")
          
          os.chdir(classdir+'\\'+subdir)
          os.system("python \""+classdir+"\\"+subdir+"\\"+"AA.py\" "+"\""+battleAnimBinary+"\" "+dir)
          os.chdir(cwd)
          
          copyfile(classdir+"\\"+subdir+"\\"+subdir[3:]+"Installer.event", classdir+"\\"+subdir[3:]+"Installer.event")
          
          os.remove(classdir+"\\"+subdir+"\\AA.py")
          os.remove(classdir+"\\"+subdir+"\\lzss.py")
          os.remove(classdir+"\\"+subdir+"\\"+subdir[3:]+"Installer.event")
          
if __name__ == '__main__':
    main()