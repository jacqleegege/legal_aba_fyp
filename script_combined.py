import subprocess
import sys
import os
import shutil 
dir_name = "cases"
files = os.listdir(dir_name)

# In the form of './filename.bk'
bk_file = sys.argv[1]

prefixes = {}

PATH = './results'
if not os.path.exists(PATH):
    os.makedirs(PATH)

for f in files:
    if 'neg' in f:
        prefix = f.partition('_neg')[0]
    else:
        prefix = f.partition('_pos')[0]

    if prefix in prefixes:
        prefixes[prefix].append(f)
    else:
        prefixes[prefix] = [f]

print(prefixes)
for prefix in prefixes:
    file_list = prefixes[prefix]
    new_file =f"{PATH}/{bk_file[2:-3]}_{prefix}.bk"

    # use copyfile() 
    shutil.copyfile(bk_file+".aba",new_file+".aba")
    f_write = open(new_file+".aba","a")

    negs = []
    pos = []

    for fi in file_list:
        filename = f"{dir_name}/{fi}"
        f = open(filename,"r")
        for line in f:
            if "% Test" in line:
                break
            f_write.write(line)

        example = f.readlines()
        test = ''.join(example).rstrip()
        split = test.split(":-")
        split = split[1:-1]
        for ex in split:
            ex = ex[:-2].strip()
            if '\\+' in ex:
                ex = ex[3:]
                negs.append(ex)
            else:
                pos.append(ex)
        f.close
    f_write.close

    command = f"consult('aba_asp.pl'), aba_asp('{new_file}',[{', '.join(pos)}],[{', '.join(negs)}])"
    print(command)
    # subprocess.run(["swipl", "-g",command,"-t","halt"]) 