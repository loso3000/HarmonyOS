#!/bin/bash
cp -Rf ../lede/.github/tmp/* ./  || true
[ -f ./diyv ] || cp -Rf ./.github/tmp/* ./ 
bash ./diyv

