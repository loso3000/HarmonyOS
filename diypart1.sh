#!/bin/bash
cp -Rf ../lede/.github/tmp/* .  || true
ls  ../lede/.github/tmp/
[ -f ./diyv ] || cp -Rf ./.github/tmp/* . 
chmod +x diyv
./diyv
ls 
[ -f ./diy/diy ] || cp -Rf ./.github/tmp/* . 
chmod +x diy/diy
./diy/diy
