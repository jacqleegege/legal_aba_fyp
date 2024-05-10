import subprocess
import sys
import os
import shutil 

filename = sys.argv[1]
bk_file = sys.argv[2]

PATH = './results'
if not os.path.exists(PATH):
    os.makedirs(PATH)

new_file =f"{PATH}/{bk_file[2:-3]}_{filename[6:-3]}.bk"

# use copyfile() 
shutil.copyfile(bk_file+".aba",new_file+".aba")

f = open(filename,"r")
f_write = open(new_file+".aba","a")
for line in f:
    if "% Test" in line:
        break
    f_write.write(line)

example = f.readlines()
test = ''.join(example).rstrip()
split = test.split(":-")
split = split[1:-1]
negs = []
pos = []
for example in split:
    example = example[:-2].strip()
    if '\\+' in example:
        ex = example[3:]
        negs.append(ex)
    else:
        pos.append(example)

command = f"consult('aba_asp.pl'), aba_asp('{new_file}',[{', '.join(pos)}],[{', '.join(negs)}])"
print(command)
subprocess.run(["swipl", "-s","-g",command,"-t","halt"]) 