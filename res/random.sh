#!/bin/bash

display_next_ascii_art() {
    directory=$1
    state_file=".ascii_art_state"
    file_list=()

    # Read state from the state file
    current_index=0
    if [[ -f "$state_file" ]]; then
        current_index=$(cat "$state_file")
    fi

    while IFS= read -r -d '' file; do
        if [[ $file == *.txt ]]; then
            file_list+=("$file")
        fi
    done < <(find "$directory" -type f -print0)

    if [[ ${#file_list[@]} -gt 0 ]]; then
        if [[ $current_index -lt ${#file_list[@]} ]]; then
            ascii_file="${file_list[$current_index]}"
            cat "$ascii_file"
            echo "$((current_index + 1))" > "$state_file"
        else
            echo "All ASCII art files have been displayed."
            rm "$state_file"
        fi
    else
        echo "No ASCII art files found in the directory."
    fi
}

# Specify the directory where your ASCII art files are stored
directory_path="etc/arts"

display_next_ascii_art "$directory_path"
