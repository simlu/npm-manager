#!/bin/bash
set -e

CWD=${PWD}
PACKAGE="{{PACKAGE}}"
if [ -z "$PACKAGE" ]; then
   FILE="package-json"
   CHECKSUM=`md5sum $CWD/package-lock.json | awk '{ print $1 }'`
else
   FILE=${PACKAGE}
   CHECKSUM=`echo -n ${PACKAGE} | md5sum | awk '{ print $1 }'`
fi

if tar --exclude='*/*' -tf "$CWD/offline/$FILE.tar.gz" | grep -q "$CHECKSUM"; then
  echo "ok"
  exit 0
else
  echo "fail"
  exit 1
fi
