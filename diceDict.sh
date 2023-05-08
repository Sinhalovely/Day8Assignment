# initialize dictionary to store results
declare -A results=()

# roll the die and store the results in the dictionary
while true; do
  # roll the die and get a random number between 1 to 6
  die_result=$(( RANDOM % 6 + 1 ))

  # increment the count for the result in the dictionary
  results[$die_result]=$(( ${results[$die_result]} + 1 ))

  # check if any number has been rolled 10 times
  for result in "${!results[@]}"; do
    echo "$result: ${results[$result]}"
    if [ "${results[$result]}" -eq 10 ]; then
      echo "$result was rolled 10 times!"
      exit
    fi
  done
done


