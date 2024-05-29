import sys
import re
filename = sys.argv[1]

f_read = open(filename,'r')
lines = f_read.readlines()
f_read.close()

f_write = open(filename,'w')
for line in lines:
    match_str = re.findall(r'\d{4}-\d{2}-\d{2}', line)
    if match_str:
        for date in match_str:
            print(date)
            year = date[:4]
            month = date[5:7]
            day = date[8:10]
            line = line.replace(date, f'd{year}_{month}_{day}')
    f_write.write(line)

f_write.close()

# Code to remove all double quotes causing ABALearn to fail
# to_replace = ", "
# replacement = "__"
# repls =str.maketrans(to_replace,replacement)

# for line in lines:
#     match_str = re.findall(r'\"(.+?)\"', line)
#     if match_str:
#         for ori in match_str:
#             print(ori)
#             const = ori
#             const = const.translate(repls)
#             const = const.replace("'",'')
#             line = line.replace(f'"{ori}"',const)
#     f_write.write(line)

# f_write.close()