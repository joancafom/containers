#!/bin/bash

components=( $(cat /opt/bitnami/.bitnami_components.json | grep ": {" | cut -d ':' -f 1 | tr -d '"') )

for component in "${components[@]}"; do
  if [[ "$component" == "mariadb" ]]; then
    which mysql
  else
    which $component
  fi
  [ $? -eq 0 ] || exit 1
done