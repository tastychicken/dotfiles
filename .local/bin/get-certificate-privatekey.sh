#!/bin/bash

FILE=${1}

if [[ $FILE != *.pfx ]]; then
  echo "not a .pfx-file"
  exit 1
fi

openssl pkcs12 -in $FILE -nocerts -nodes | tail -n +8 | awk -v ORS='\\n' '1' | sed "s/.\{2\}$//"; echo
