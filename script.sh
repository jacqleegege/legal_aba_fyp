MERGED="merged.bk.aba"
MERGED_PATH="./merged.bk"
EXAMPLE_FILE="cases/s3306_a_2_B_neg.pl"
if [ "$1" ]
  then
    FILE=$1 

else
  cat sara_translated/*.bk.aba > $MERGED
fi

python3 script.py $EXAMPLE_FILE $MERGED_PATH
# swipl -q -t "[$COMMAND1,$COMMAND2]" -g "halt."
# swipl -g "consult('aba_asp.pl'), aba_asp('./merged.bk',[],[])" -t halt