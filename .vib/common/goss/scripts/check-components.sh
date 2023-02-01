#!/bin/bash

components=( $(cat /opt/bitnami/.bitnami_components.json | grep ": {" | cut -d ':' -f 1 | tr -d '"') )

for component in "${components[@]}"; do
  if [[ "$component" == "mariadb" ]]; then
    which mysql
  elif [[ "$component" == "apache" ]]; then
    which apachectl
  else
    which $component
  fi
  [ $? -eq 0 ] || exit 1
done