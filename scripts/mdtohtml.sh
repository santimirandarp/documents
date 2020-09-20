#!/bin/bash -x
#USAGE
#1. mdtohtml DIRECTORY FILE(S)
#2. mdtohtml linux linux/*linux.md
#to run you need to be on the md directory

DIRECTORY=$1
echo "if you're overwriting a file, you'll be prompted to confirm"
sleep 2
cd ../md
#it removes the directory 
shift 1
echo $@
for FILE in $@
do
  FILENAME=$FILE
  BASENAME=$(basename $FILE .md)
  marked ${FILENAME}  -o ${BASENAME}.html && echo "Converted" || echo "can't convert ${FILENAME}"
  mv -iv ${BASENAME}.html ../pages/${DIRECTORY}/ && echo "Ok"
  mv -iv $FILE moved/
done
