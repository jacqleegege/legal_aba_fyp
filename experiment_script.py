import sys
import random
import math
import subprocess
import shutil 

# File with background knowledge
experiment_file = sys.argv[1]

train_test_split = 0.5
if len(sys.argv) > 2:
    train_test_split = sys.argv[2]

# SPLIT for train set, the rest is for test (opposite split for test)

pos_neg_split = 0.5
if len(sys.argv) > 2:
    pos_neg_split = sys.argv[3]

pos_examples = []
neg_examples = []
exp_file = open(experiment_file,'r')

bk = exp_file.readlines()

for line in bk:
    line = line.strip()
    if '%positives' in line:
        pos = line.split(':')[1]
        pos_examples = pos.split('),')
        new = []
        for item in pos_examples:
            if item[-1]!=')':
                item = item + ')'
            new.append(item)
        pos_examples = new

    if '%negatives' in line:
        neg = line.split(':')[1]
        neg_examples = neg.split('),')
        new = []
        for item in neg_examples:
            if item[-1]!=')':
                item = item + ')'
            new.append(item)
        neg_examples = new

# Assume at least 2 pos and neg examples
# TODO: add handling for splitting pos/neg, and cross validation
if pos_examples and neg_examples:
    wrong_positive = []
    wrong_negative = []
    section = pos_examples[0].split('(')[0]
    total_examples = len(pos_examples) + len(neg_examples)
    correct_brave = 0
    correct_cautious = 0
    total_ran = 0
    for i in range(len(pos_examples)):
        new_file = f'experiments/{section}_pos_{i+1}.bk.aba'
        f = open(new_file,'w')
        f.close()
        shutil.copyfile(experiment_file,new_file)
        f = open(new_file,'a')
        f.write(f'\n%Test : {pos_examples[i]}')
        f.close()
        new_pos = pos_examples[:i] + pos_examples[i+1 :]
        # Brave mode by default
        command = f"consult('aba_asp.pl'), set_lopt(learning_mode(brave)), aba_asp('{new_file[:-4]}',[{', '.join(new_pos)}],[{', '.join(neg_examples)}])"
        print(command)
        # Timeout in 10 mins if doesn't run
        try:
            p = subprocess.run(["swipl","-g",command,"-t","halt"],timeout=180) 
        except subprocess.TimeoutExpired:
            print(f'Timeout for {experiment_file} executed!')
            continue
        
        sol_file = f'{new_file[:-4]}.sol.asp'
        total_ran += 1
        f = open(sol_file,'a')
        f.write(f'\n:- not {pos_examples[i]}.')
        f.close()

        wrong = False
        out_brave = subprocess.run(["clingo",sol_file,"--enum-mode","brave"],capture_output=True) 
        if b'UNSATISFIABLE' not in out_brave.stdout:
            correct_brave += 1

            f = open(sol_file,'a')
            f.write('\n%CORRECT!')
            f.close()
        else:
            f = open(sol_file,'a')
            f.write('\n%WRONG!')
            f.close()
            wrong = True

        out_cautious = subprocess.run(["clingo",sol_file,"--enum-mode","cautious"],capture_output=True) 
        if b'UNSATISFIABLE' not in out_cautious.stdout:
            correct_cautious += 1

            f = open(sol_file,'a')
            f.write('\n%CORRECT!')
            f.close()
        else:
            f = open(sol_file,'a')
            f.write('\n%WRONG!')
            f.close()
            wrong = True

        if wrong:
            wrong_positive.append(sol_file)

    for i in range(len(neg_examples)):
        new_file = f'experiments/{section}_neg_{i+1}.bk.aba'
        f = open(new_file,'w')
        f.close()
        shutil.copyfile(experiment_file,new_file)
        f = open(new_file,'a')
        f.write(f'\n%Test : not {neg_examples[i]}')
        f.close()
        new_neg = neg_examples[:i] + neg_examples[i+1 :]
        # Brave mode by default
        command = f"consult('aba_asp.pl'), set_lopt(learning_mode(brave)), aba_asp('{new_file[:-4]}',[{', '.join(pos_examples)}],[{', '.join(new_neg)}])"
        print(command)
        # Timeout in 10 mins if doesn't run
        try:
            p = subprocess.run(["swipl","-g",command,"-t","halt"],timeout=180) 
        except subprocess.TimeoutExpired:
            print(f'Timeout for {experiment_file} executed!')
            continue
        
        sol_file = f'{new_file[:-4]}.sol.asp'
        total_ran += 1
        f = open(sol_file,'a')
        f.write(f'\n:- {neg_examples[i]}.')
        f.close()

        wrong = False
        out = subprocess.run(["clingo",sol_file,"--enum-mode","brave"],capture_output=True) 
        if b'UNSATISFIABLE' not in out.stdout:
            correct_brave += 1

            f = open(sol_file,'a')
            f.write('\n%BRAVE CORRECT!')
            f.close()
        else:
            f = open(sol_file,'a')
            f.write('\n%BRAVE WRONG!')
            f.close()
            wrong = True
        out = subprocess.run(["clingo",sol_file,"--enum-mode","cautious"],capture_output=True) 
        if b'UNSATISFIABLE' not in out.stdout:
            correct_cautious += 1

            f = open(sol_file,'a')
            f.write('\n%CAUTIOUS CORRECT!')
            f.close()
        else:
            f = open(sol_file,'a')
            f.write('\n%CAUTIOUS WRONG!')
            f.close()
            wrong = True

        if wrong:
            wrong_negative.append(sol_file)


    f = open(experiment_file,'a')
    f.write(f'\n%ACCURACY_BRAVE: {correct_brave}/{total_ran}')
    f.write(f'\n%ACCURACY_CAUTIOUS: {correct_cautious}/{total_ran}')
    f.write(f'\n%WRONG POSITIVES: {wrong_positive}')
    f.write(f'\n%WRONG NEGATIVES: {wrong_negative}')
    f.close()



# figure out how to query in clingo/asp








