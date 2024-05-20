import shutil

dir_name = "cases"
split_file = './sara/splits/train_s1.txt'
newfile = 'concated.bk.aba'
f_new = open(newfile,'a')
f_read = open(split_file,'r')
for line in f_read:
    file_concat = f"./{dir_name}/{line.strip()}.pl"
    f = open(file_concat,'r')
    shutil.copyfileobj(f, f_new)
