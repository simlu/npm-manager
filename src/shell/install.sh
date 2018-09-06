#!/bin/bash
set -e

echo "-------------------"
echo "Creating Cache Folder"
echo "-------------------"
PACKAGE="{{PACKAGE}}"
ARGS="{{ARGS}}"
if [ -z "$PACKAGE" ]; then
   FILE="package-json"
   FLAG=""
else
   FILE=${PACKAGE}
   FLAG="-g"
fi
CWD=${PWD}
NPM_CACHE_DIR=$(mktemp -d -t)
export npm_config_cache="$NPM_CACHE_DIR"
npm cache verify

echo "-------------------"
echo "Populating Cache"
echo "-------------------"
tar xzf "offline/$FILE.tar.gz" -C ${NPM_CACHE_DIR}
npm cache verify

echo "-------------------"
echo "Cached Install"
echo "-------------------"
if [ -z "$FLAG" ]; then
  rm -rf node_modules
fi
npm i ${FLAG} ${PACKAGE} --offline --no-save ${ARGS}
npm cache verify

echo "-------------------"
echo "Cleanup"
echo "-------------------"
rm -rf "$NPM_CACHE_DIR"
