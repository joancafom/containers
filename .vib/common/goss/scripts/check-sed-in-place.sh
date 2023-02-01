#!/bin/bash

files=( $(find /bitnami /opt/bitnami/ -name "*.sh") )

for file in "${files[@]}"; do
  if [[ $(grep -cE "sed -i|sed --in-place" $file) -gt 0 ]]; then
    exit 1
  fi
done