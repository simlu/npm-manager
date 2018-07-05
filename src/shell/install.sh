#!/bin/bash

echo "-------------------"
echo "Creating Cache Folder"
echo "-------------------"
CWD=${PWD}
DIR=$(mktemp -d -t)
export npm_config_cache="$DIR"
npm cache verify

echo "-------------------"
echo "Populating Cache"
echo "-------------------"
tar xzf offline/offline.tar.gz -C ${DIR}
npm cache verify

echo "-------------------"
echo "Cached Install"
echo "-------------------"
rm -rf node_modules
npm i --offline
npm cache verify

echo "-------------------"
echo "Cleanup"
echo "-------------------"
rm -rf "$DIR"
