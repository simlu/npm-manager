#!/bin/bash
set -e

CWD=${PWD}
PACKAGE="{{PACKAGE}}"
if [ -z "$PACKAGE" ]; then
   FILE="package-json"
else
   FILE=${PACKAGE}
fi

echo "-------------------"
echo "Init Temporary Npm Cache"
echo "-------------------"
NPM_INSTALL_DIR=$(mktemp -d -t)
if [ -z "$PACKAGE" ]; then
  cp "$CWD/package.json" "$NPM_INSTALL_DIR/."
  cp "$CWD/package-lock.json" "$NPM_INSTALL_DIR/."
fi;
NPM_CACHE_DIR=$(mktemp -d -t)
export npm_config_cache="$NPM_CACHE_DIR"
npm cache verify

echo "-------------------"
echo "Populating Cache"
echo "-------------------"
(cd ${NPM_INSTALL_DIR} && npm i ${PACKAGE} --no-save)
npm cache verify

echo "-------------------"
echo "Zipping Cache"
echo "-------------------"
rm -rf "$CWD/offline/$FILE.tar.gz"
mkdir -p "$CWD/offline"
(cd ${NPM_CACHE_DIR} && tar -czf "$CWD/offline/$FILE.tar.gz" "_cacache")
npm cache verify

echo "-------------------"
echo "Cleanup"
echo "-------------------"
rm -rf "$NPM_INSTALL_DIR"
rm -rf "$NPM_CACHE_DIR"
