#!/bin/bash
cp -Rf ../lede/.github/tmp/* ./  || true
[ -f ./diyv ] || cp -Rf ./.github/tmp/* ./
mv -f ./.github/tmp/* ./
mv -f ../lede/.github/tmp/* ./
chmod +x diyv
./diyv
