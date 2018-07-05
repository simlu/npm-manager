#!/bin/bash

echo "-------------------"
echo "Creating Cache Folder"
echo "-------------------"
CWD=${PWD}
DIR=$(mktemp -d -t)
export npm_config_cache="$DIR"
npm cache verify

echo "-------------------"
echo "Clearing Local Data"
echo "-------------------"
rm -rf offline.tar.gz
rm -rf node_modules
npm cache verify

echo "-------------------"
echo "Populating Cache"
echo "-------------------"
npm i --no-safe
npm cache verify

echo "-------------------"
echo "Testing Cached Install"
echo "-------------------"
rm -rf node_modules
npm i --offline
npm cache verify

echo "-------------------"
echo "Zipping Cache"
echo "-------------------"
mkdir -p offline
(cd ${DIR} && tar -czf "$CWD/offline/offline.tar.gz" "_cacache")
npm cache verify

echo "-------------------"
echo "Cleanup"
echo "-------------------"
rm -rf "$DIR"
