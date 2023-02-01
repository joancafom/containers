#!/bin/bash

openssl_bin="/opt/bitnami/common/bin/openssl"
openssl_version="1.0.1u"

if [[ -f $openssl_bin ]]; then
  $openssl_bin version | grep -s $openssl_version
  [ $? -eq 0 ] || exit 1
fi