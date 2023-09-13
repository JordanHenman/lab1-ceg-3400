#!/bin/bash

> hashes.txt # Creates the hashes file

for nonce in {100..1000}; do # Creating a nonce using the numbers between 100 and 1000, once 1000 is reached the script automaticly stops
  while read -r word; do
    data="${nonce}-${word}" # Combing the nonce and word with a dash inbetween.
    
    hash_result=$(printf "$data" | sha256sum | cut -d ' ' -f 1) # Hashing the nonce and word combo
    
    echo "${hash_result} - ${data}" >> hashes.txt # Writing the data to the hashes file
  done < dictionary.txt # Closing the dictionary file
done

echo "Mining Complete." # Announcing that the script is finished

# So pretty much this bash file nonces and then hashes the dictionary words and outputs them into the hash file.
# I did it this way because it seemed alot easier than searching through the hashes in bash.
# To find valued coins I went into notepad and searched through the coins file for 000 until I found 3.
# The words are hashed like this: "673-in" including the dash. So be mindful of that.
# Also make sure to chmod +x this script so that it actually works.