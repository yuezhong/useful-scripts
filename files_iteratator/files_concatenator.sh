#!/bin/bash

# takes an argument from the command line: path/to/dir
FILES=$1
seperator=$'--------------------------------------------------------------------------------------------------------------\n\n'

for f in $FILES*
do
  # grabs the filenames and append it to the file
  echo "$f" >> combinedFiles.txt
  echo "--------------------------------------------------------------------------------------------------------------" >> combinedFiles.txt
  # concat the files into the output file
  cat $f >> combinedFiles.txt
  echo "$seperator" >> combinedFiles.txt
done
