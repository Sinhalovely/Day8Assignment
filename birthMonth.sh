declare -A results=()#intializing dictionary to store results
for ((i=1; i<=50; i++))
do
  b_year=$((RANDOM%2+92))
  b_month=$((RANDOM%12+1))
  b_date="$b_month/$b_year"
  birthday[$b_month]="${birthday[$b_month]} $b_date"
done

#echo "${birthday[@]}"
for month in ${!birthday[@]}
do
  echo "Birthdays in month $month: ${birthday[$month]}"
done

declare -A same_birth_month=()
for month in ${!birthday[@]}
do
 for bday in ${birthday[$month]}; do
  if [[ ${same_birth_month[$bday]+_} ]]
  then
    same_birth_month[$bday]+=",$month"
  else
    same_birth_month[$bday]="$month"
  fi
 done
done

echo "Birthdays with same month"
for bday in ${!same_birth_month[@]}
do
 echo "People with the same birthday ($bday): ${same_birth_month[$bday]}"
done

