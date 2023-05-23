#!/bin/bash

echo "#GO TO THIS DIR AND CHECK OUT PRE-BUILT WORD_LISTS:"
echo "#HERE: etc/wordlist"

function crack_password() {
    # This function takes an MD5 hash and a word list file as arguments and tries to crack the password

    # Assign the arguments to variables
    local md5_hash
    local word_list_file

    read -p "#Enter your hash here: " md5_hash
    read -p "#Enter the path to your word list: " word_list_file

    echo "#Cracking Hash please wait this might take some time!!"
    
    # Loop through each word in the word list file
    while read word; do
        # Generate the MD5 hash for the word
        hash=$(echo -n $word | md5sum | awk '{print $1}')
        
        # Compare the generated hash with the provided hash
        if [ "$hash" == "$md5_hash" ]; then
            echo "Password cracked: $word" >> crackedPasswd.txt
            cat crackedPasswd.txt
            return 0
        fi
    done < "$word_list_file"
    echo ""
    echo ""
    
    # If no match is found, return failure
    echo "Password not found in word list"
    return 1
}
crack_password