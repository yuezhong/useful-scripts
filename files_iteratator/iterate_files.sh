#!/bin/bash
# template script to iterate through files in a folder

# path to files
FILES=$1

for f in $FILES*
do
    echo "Processing $f file..."
    # Do something. Just cat'ing the filename out for now
    cat "$f"

done
