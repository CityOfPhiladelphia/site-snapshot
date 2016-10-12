#! /bin/bash

# Replace the absolute paths to the domain with host-relative paths.
for i in $(grep -l -r "https://$2" $1 --include="*.html")
do
    echo "Replacing host in $i with /"
    sed -i "s/https:\/\/$2\//\//g" $i
    sed -i "s/https:\/\/$2/\//g" $i
done

for i in $(grep -l -r "http://$2" $1 --include="*.html")
do
    echo "Replacing host in $i with /"
    sed -i "s/http:\/\/$2\//\//g" $i
    sed -i "s/http:\/\/$2/\//g" $i
done
