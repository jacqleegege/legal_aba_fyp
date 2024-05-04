# def date_split_file(filename):
#     f = open(filename+".bk.aba", "r")
#     f_write = open(filename+"_date_split.bk.aba", "a")
#     for line in f:
#         date = line[5:-3]
#         year = int(date[1:5])
#         month = int(date[6:8])
#         day = int(date[9:11])
#         new = f"date_split({date},{year},{month},{day}).\n"
#         f_write.write(new)
#     f_write.close
#     f.close

def create_date_split(date):
    year = int(date[1:5])
    month = int(date[6:8])
    day = int(date[9:11])
    new = f"date_split({date},{year},{month},{day}).\n"
    return new

from datetime import date, timedelta

def date_range_list(start_date, end_date,filename):
    # Return list of datetime.date objects (inclusive) between start_date and end_date (inclusive).
    f = open(filename+".bk.aba", "a")
    f_split = open(filename+"_date_split.bk.aba", "a")
    curr_date = start_date
    while curr_date <= end_date:
        curr = curr_date.strftime("%Y-%m-%d")
        curr = f'"{curr}"'
        date = f'date({curr}).\n'
        date_split = create_date_split(curr)
        f.write(date)
        f_split.write(date_split)
        curr_date += timedelta(days=1)
    f.close
    f_split.close

def year_list():
    f = open("bk/years.bk.aba", "a")    
    for i in range(1900,2150):
        year = f"year({i}).\n"
        f.write(year)
    f.close

def number_list():
    f = open("bk/numbers.bk.aba", "a")    
    for i in range(10000):
        number = f"number({i}).\n"
        f.write(number)
    f.close

def finance_list():
    f = open("bk/finance.bk.aba", "a")    
    for i in range(1000000000):
        number = f"finance({i}).\n"
        f.write(number)
    f.close

start_date = date(year=2100, month=1, day=1)
stop_date = date(year=2149, month=12, day=31)
filename = "bk/dates/2100-2149"
# date_range_list(start_date, stop_date,filename)
# year_list()
finance_list()