import re

filename = "cases/s1_a_1_pos.pl"

with open(filename, 'r') as file:
  lines = file.readlines()

# Replace the target string
rename_list = ['alice','bob','spouse','joint_return','alice_and_spouse']

section = '_' + filename[6:-3]
replacements = {}
for name in rename_list:
    old_name = rf'\b{name}\b'
    replacements[old_name] = name+section

def replace_all(text, dic):
    for i, j in dic.items():
        text = re.sub(i,j,text)
    return text

for i in range(len(lines)):
    if lines[i].startswith('%'):
        continue
    lines[i] = replace_all(lines[i],replacements)

# Write the file out again
with open(filename, 'w') as file:
    file.writelines(lines)