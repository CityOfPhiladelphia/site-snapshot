#! /bin/bash

# Get rid of querystrings
for i in `find $1 -type f | grep ?`
do
    echo "Removing querystring from $i"
    mv $i `echo $i | cut -d? -f1`
done
