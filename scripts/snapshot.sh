#! /bin/bash

SCRIPT_DIR=$(dirname $0)
DOMAIN=$1

wget --mirror --page-requisites -e robots=off -X /wp-json/oembed/ --no-check-certificate --output-file=wgetlog.txt https://$DOMAIN/
$SCRIPT_DIR/remove_querystrings.sh $DOMAIN
$SCRIPT_DIR/rename_duplicate_ext.sh $DOMAIN
$SCRIPT_DIR/rename_dotless_files.sh $DOMAIN
$SCRIPT_DIR/make_host_relative_urls.sh $DOMAIN $DOMAIN

# Clear out all the files from _site except for the .git folder
mkdir -p _site
rm -rf _site/*
mv $DOMAIN/* _site
rm -r $DOMAIN
