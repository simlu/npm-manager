#!/bin/bash
set -e

echo "-------------------"
echo "Creating Cache Folder"
echo "-------------------"
PACKAGE="{{PACKAGE}}"
if [ -z "$PACKAGE" ]; then
   FILE="package-json"
   FLAG=""
else
   FILE=${PACKAGE}
   FLAG="-g"
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
if [ -z "$FLAG" ]; then
  rm -rf node_modules
fi
npm i ${FLAG} ${PACKAGE} --offline --no-save
npm cache verify

echo "-------------------"
echo "Cleanup"
echo "-------------------"
rm -rf "$DIR"
