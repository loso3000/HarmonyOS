#!/bin/bash
cp -Rf ../lede/.github/tmp/* .  || true
[ -f ./diy.sh ] || cp -Rf ./.github/tmp/* . 
chmod +x diy.sh
./diy.sh
