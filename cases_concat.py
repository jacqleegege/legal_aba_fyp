# import shutil

# dir_name = "cases"
# split_file = './sara/splits/train_s1.txt'
# newfile = 'concated.bk.aba'
# f_new = open(newfile,'a')
# f_read = open(split_file,'r')
# for line in f_read:
#     file_concat = f"./{dir_name}/{line.strip()}.pl"
#     f = open(file_concat,'r')
#     shutil.copyfileobj(f, f_new)

import subprocess

out = subprocess.run(["clingo","experiments/s3306_c_16_learning.bk.sol.asp","--enum-mode","brave"],capture_output=True)
print(out.stdout.splitlines())
if b'SATISFIABLE' in out.stdout:
    print("ayy")