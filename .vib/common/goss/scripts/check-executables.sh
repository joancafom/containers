#!/bin/bash

files=( $(find /opt/bitnami/$BITNAMI_APP_NAME /opt/bitnami/common -type f -executable) )

for file in "${files[@]}"; do
  if [[ ! -x $file ]] || [[ $(ldd $file | grep -c "not found") -gt 0 ]]; then
    exit 1
  fi
done