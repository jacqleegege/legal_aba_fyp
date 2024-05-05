import re
import sys

filename = sys.argv[1]

with open(filename, 'r') as file:
  lines = file.readlines()

# Replace the target string
rename_list = ['alice','bob','charlie','cameron','dan','dorothy','emily',
               'fred','george',
               'spouse','joint_return','alice_and_spouse','alice_and_bob',
               'alice_dies','charlie_is_son','charlie_and_bob_residence',
               'bob_s_house','charlie_marriage','charlie_and_spouse_joint_return',
               'charlie_makes_money','bob_maintains_household_','bob_income_2016',
               'alice_and_charlie','bob_and_charlie','alice_is_nra','charlie_and_dan',
               's21','charlie_is_brother','bob_makes_money','someone_maintains_household_',
               'charlie_is_father','alice_and_bob_divorce','alice_is_a_nra','bob_is_a_nra',
               'bob_income_','alice_is_paid','itemized_deduction','alice_and_bob_file_a_joint_return',
               'bob_is_paid','bob_and_alice_joint_return','bob_itemized_deduction','wbft_is_a_trust',
               'deduction_alice_2017','alice_is_born','bob_is_born','alice_is_blind','alice_makes_money',
               'alice_and_bob_joint_return','bob_is_son','home','bob_and_charlie_joint_return',
               'alice_child','dorothy_and_bob','charlie_and_bob','alice_works','bob_works',
               'alice_employer_2017-','alice_employer','bob_employer','alice_pays','bob_pays',
               'alice_pays_bob','alice_employer_bob','alice_employer_charlie','alice_pays_charlie',
               'alice_employer_dan','alice_pays_dan','alice_pays_retirement','retirement_fund',
               'alice_pays_insurance','health_insurance_fund','charlie_retires','life_insurance_fund',
               'alice_runs_a_factory','alice_lays_bob_off','bob_retires','bob_is_disabled',
               'disability_plan','bob_dies','alice_is_american','bob_is_american',
               'alice_is_american_employer','bob_is_mexican','bob_migrates_to_usa',
               'bob_brother_of_alice','bob_father_of_alice','alice_employed',
               'hopkins_is_a_university','alice_goes_to_hopkins','alice_goes_to_class',
               'bob_and_alice','bob_employed','hopkins_is_a_hospital','hopkins_is_a_nursing_school',
               'imf_is_an_international_organization','hospital','hospital_is_a_medical_institution',
               'alice_goes_to_hospital','jail','jail_is_a_penal_institution','alice_goes_to_jail',
               'alice_is_venezuelan','charlie_is_born','charlie_residence','alice_s_house',
               'alice_residence','alice_maintains_household_','bob_lives_alice_house']

replacements = {}
for name in rename_list:
    section = '_' + filename[6:-3]
    old_name = rf'\b{name}\b'
    if name[-1] == '_' or name[-1] == '-' :
        old_name = name
        section = filename[6:-3]
    replacements[old_name] = name+section

print(replacements)

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