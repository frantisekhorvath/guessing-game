#!/bin/bash

set -e

function check_input () {
  local number=$1
  while ! [[ "$number" =~ ^[0-9]*$ ]] || [ -z $number ] 
  do
    echo "Input must be non-negative number. Try again:" >&2
    read number
  done
  echo $number
}

noFiles=$( ls -1 | wc -l )

echo "How many files are in current directory? Make a guess:"
read guess
guess=$( check_input $guess )

while [ $guess -ne $noFiles ]
do
  if [ "$guess" -gt "$noFiles" ]
  then
    echo "Your guess is too high. Try again:"
  else
    echo "Your guess is too low. Try again:"
  fi 
  read guess
  guess=$( check_input $guess )
done

echo "Congratulations!"
exit 0
