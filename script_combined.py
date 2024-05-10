import subprocess
import sys
import os
import shutil 

#  Merges cases of the same statute/predicate and run them together
#  in ABALearn.
dir_name = "cases"
files = os.listdir(dir_name)

# In the form of './filename.bk'
bk_file = sys.argv[1]
specified_statute = sys.argv[2] if len(sys.argv) >= 3 else ''


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

# print(prefixes)
for prefix in prefixes:
    if specified_statute and specified_statute != prefix:
        continue

    file_list = prefixes[prefix]
    new_file =f"{PATH}/{bk_file[2:-3]}_{prefix}.bk"

    # use copyfile() 
    shutil.copyfile(bk_file+".aba",new_file+".aba")
    f_write = open(new_file+".aba","a")
    f_write.write("\n% CASES START HERE \n")

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
        pref = ""
        for ex in split:
            ex = ex[:-2].strip()
            if '\\+' in ex:
                ex = ex[3:]
                negs.append(ex)
            else:
                pos.append(ex)
            pref = ex.split("(")[0]
        f.close()
    f_write.close()

    # Code to comment out head rule of current statute predicate
    f_initial = open(new_file+".aba","r")
    initial = f_initial.readlines()
    f_initial.close()
    start = False
    for i in range(len(initial)):
        line = initial[i]
        if "CASES START HERE" in line:
            break
        if start:
            initial[i] = "%" + line
            if initial[i].rstrip()[-1] == '.':
                start = False
        if line.startswith(pref + '('):
            start = True
            initial[i] = "%" + line

    f_edit = open(new_file+".aba","w")
    f_edit.writelines(initial)
    f_edit.close()

    command = f"consult('aba_asp.pl'), set_lopt(learning_mode(brave)), aba_asp('{new_file}',[{', '.join(pos)}],[{', '.join(negs)}])"
    subprocess.run(["swipl","-g",command,"-t","halt"]) 