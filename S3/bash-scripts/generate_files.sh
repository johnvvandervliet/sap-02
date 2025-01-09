#! /usr/bin/env bash

# where we will store the files
OUTPUT_DIR="/tmp/s3-bash-scripts"

# Create the output folder
mkdir -p $OUTPUT_DIR

# genarte a random number to determine the number of files to create
NUM_FILES=$((RANDOM % 6 + 5))

for ((i=1; i<=$NUM_FILES; i++)); do
    #generate a random file
    FILENAME = "$OUTPUT_DIR/file_$i.txt"

    #generate  random data and write it to the file
    dd if=/dev/urandom of="$FILENAME" bs=1024 count=$((RANDOM % 1024 * 1)) 2>/dev/null
 done