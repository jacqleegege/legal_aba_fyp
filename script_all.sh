# MERGED="merged.bk.aba"
# MERGED_PATH="./merged.bk"
# EXAMPLE_FILE="cases/s3306_a_2_B_neg.pl"
# if [ "$1" ]
#   then
#     FILE=$1 
#     MERGED_PATH="./${FILE}"

# else
#   cat sara_translated/*.bk.aba > $MERGED
# fi

# for file in cases/*
# do
#   python3 script.py $file $MERGED_PATH
# done

for file in cases/*
do
  python3 rename.py $file
done
