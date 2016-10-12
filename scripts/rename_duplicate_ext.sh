#! /bin/bash

# Rename .1 extensions as index.html files. This assumes that all files ending
# in .1 are named as such in order to avoid conflicts with the name of some
# folder.
for i in `find $1 -type f | grep "\.1$"`
do
    echo "Moving $i to a folder with an index.html"
    DIRNAME=${i%".1"}
    # OLDFILENAME=${i#"`dirname $i`"}
    # NEWFILENAME=${OLDFILENAME%".1"}
    mkdir -p $DIRNAME
    mv "$i" "$DIRNAME/index.html"

    # for j in `grep -L -r --color=never -m 1 $OLDFILENAME`
    # do
    #     sed -i "s/\/$OLDFILENAME/\/$NEWFILENAME/g" "$j"
    # done
done
