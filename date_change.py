import sys
import re
filename = sys.argv[1]

f_read = open(filename,'r')
lines = f_read.readlines()
f_read.close()

f_write = open(filename,'w')
for line in lines:
    match_str = re.search(r'\"\d{4}-\d{2}-\d{2}\"', line)
    if match_str:
        date = match_str.group()
        year = date[1:5]
        month = date[6:8]
        day = date[9:11]
        line = line.replace(date, f'd{year}_{month}_{day}')
    f_write.write(line)

f_write.close()