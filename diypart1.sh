#!/bin/bash
cp -Rf ../lede/.github/tmp/* .  || true
[ -f ./diy/diy ] || cp -Rf ./.github/tmp/* . 
chmod +x diy/diy
./diy/diy
