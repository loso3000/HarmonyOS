#!/bin/bash
ls -a ../
cp -Rf ../lede/.github/tmp/* .  || true
ls -a ../lede/.github/tmp/*
[ -f ./diy2.sh ] || cp -Rf ./.github/tmp/* . 
ls -a ./.github/tmp
chmod +x diy2.sh
./diy2.sh
ls -a
