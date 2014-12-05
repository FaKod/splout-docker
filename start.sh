#!/bin/bash

/etc/bootstrap.sh

/usr/local/splout-distribution-0.3.0/bin/splout-service.sh qnode start
/usr/local/splout-distribution-0.3.0/bin/splout-service.sh dnode start

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi