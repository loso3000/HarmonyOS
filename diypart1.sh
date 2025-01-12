#!/bin/bash
cp -Rf ../lede/.github/tmp/* .  || true
[ -f ./diy ] || cp -Rf ./.github/tmp/* . 
chmod +x diy
./diy
