#!/bin/bash
function display_error {
    echo "Error: $1"
    exit 1
}
function check_directory_exists {
    if [ ! -d "$1" ]; then
        display_error "Directory '$1' does not exist."
    fi
}
function move_files_to_sorted {
    mkdir -p "$1/sorted"
    count=0
    for file in "$1"/*; do
        if [ -f "$file" ]; then
            mv "$file" "$1/sorted/"
            ((count++))
        fi
    done
    echo "Success: $count files moved to 'sorted' directory."
}

read -p "Enter the name of a directory: " input_directory

check_directory_exists "$input_directory"

sorted_files=$(ls "$input_directory" | sort)

echo "List of files in '$input_directory':"
echo "$sorted_files"

# Move files to the 'sorted' directory
move_files_to_sorted "$input_directory"
