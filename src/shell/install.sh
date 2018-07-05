#!/bin/bash
set -e

echo "-------------------"
echo "Creating Cache Folder"
echo "-------------------"
PACKAGE=""
if [ -z "$PACKAGE" ]; then
   FILE="package-json"
else
   FILE=PACKAGE
fi
CWD=${PWD}
DIR=$(mktemp -d -t)
export npm_config_cache="$DIR"
npm cache verify

echo "-------------------"
echo "Populating Cache"
echo "-------------------"
tar xzf "offline/$FILE.tar.gz" -C ${DIR}
npm cache verify

echo "-------------------"
echo "Cached Install"
echo "-------------------"
rm -rf node_modules
npm i ${PACKAGE} --offline
npm cache verify

echo "-------------------"
echo "Cleanup"
echo "-------------------"
rm -rf "$DIR"
