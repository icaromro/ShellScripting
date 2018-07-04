#!/bin/bash
#
# Name: pattern.ksh
# Desc: Checking patterns on file
# Auth: Icaro Oliveira
# 
# This script should be able to go through a file and check for patterns
echo " "
echo "Current Date: `date`"

FILE_PATH="C:/pru/pru.dsv"

## add here the lists of patterns we should check on the file
declare -a arr=("LM3AW4S-036845" "LW1NG7S-036957" "LM5552S-036730" "LW2BHES-037111" "LW5BGZS-031382" "LW2AJ8S-037125" "LM5542S-036756" "LM7ADVS-031311" "LW5BKWS-038137" "LW5BX8A-038137" "LM5802T-001966" "LW2BH3S-037150" "LM3BHOS-035485" "LW6AWKS-031382" "LW3MEBS-036960" "LM5535S-032476" "LW9BNAS-037226" "LM7ADOS-037619" "LW2BH4S-032507" "LU9ADTS-032614" "LW3BSXS-036940" "LW5BSJS-037111" "LM3BHSS-032509" "LM3AW4S-026677" "LM3BF7S-001966" "LW7AUWS-037209" "LM3BKES-037949" "IG5577S-037397" "LM5603S-030380" "LW5BUGS-037111" "LM7AEQS-001966" "LM3BJ7S-037588" "LM9779S-031382" "LW7AQXS-037111" "LW6AXIS-037103" "LW2BIBS-037133" "LW7AQLS-037116" "LM3BHSS-037403" "LW5BKWS-038142" "LW2AUPS-036835" "LM3BJ7S-031382" "LW9BYFS-038133" "LM7ADVS-036744" "LW5BEIS-0001" "LM5895T-0001" "LM7ABRS-0001" "LM7ACVS-0001" "LM7AE3S-0014" "LW5BGZS-0001" "LW7AT4S-0002" "LM5466T-0001" "LM9687S-0001" "LW6AXHS-0001" "LU9ADTS-0920" "LW9BPLS-0023")
declare -a prob_arr 

for i in "${arr[@]}"
do
   echo " "
   echo "Checking for $i..."
   contador=$(grep -c $i ${FILE_PATH})
   
   #echo ${contador}
   
   if(($contador == 0)); then 
      echo "$i was not fount on the file"            
      prob_arr+=($i) 
   else
      echo "$i was fount $contador times"     
   fi          
done

echo " "
if((${#prob_arr[@]} == 0)); then
   echo "All patterns were found in the file"
else
   echo "These are the missing patterns:"
   echo ${prob_arr[@]}
fi
exit 0;
