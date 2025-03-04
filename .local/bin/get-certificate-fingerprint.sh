#!/bin/bash

FILE=${1}

if [[ $FILE != *.cer ]]; then
  echo "not a .cer-file"
  exit 1
fi

openssl x509 -fingerprint -in $FILE -noout | sed "s/^.\{17\}//g" | sed "s/://g"

