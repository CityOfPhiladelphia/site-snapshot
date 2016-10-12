#! /bin/bash

function find_in_string() {
    echo $1 | grep -q "$2"
}

# Rename all files that have no dots as index.html files. This assumes that any
# file without a dot in its name actually refers to the default index in a
# folder, and is simply missing the trailing slash. This should be fine in all
# cases except when a path with no trailing slash and the same path with a
# trailing could refer to different resources.
for i in `find $1 -type f`
do
    FILENAME=${i#"`dirname $i`"}
    TEMPFILE=`mktemp`
    if ! find_in_string $FILENAME "\."
    then
        echo "Making $i a folder with an index.html"
        mv "$i" "$TEMPFILE"
        mkdir -p "$i"
        mv "$TEMPFILE" "$i/index.html"
    fi
done
