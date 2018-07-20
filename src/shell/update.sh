#!/bin/bash

if ! [ -x "$(command -v ncu)" ]; then
  echo 'Error: ncu is not installed.' >&2
  return 1;
fi

echo "Updating Dependencies..."

rm -rf node_modules/ package-lock.json

ncu -u
npm i

[ -d .git ] && git add "package-lock.json"

echo "Done"
