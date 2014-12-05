#!/bin/bash

cd /usr/local/splout-distribution-0.3.0/

hadoop fs -put examples examples

hadoop jar splout-hadoop-0.3.0-hadoop.jar simple-generate --input examples/world/city.csv --output \
  database-files --tablespace city_pby_country_code --table city --separator , --escape \\ --quotes \
  \"\"\" --nullstring \\N --schema \
  "id:int,name:string,country_code:string,district:string,population:int" --partitionby country_code \
  --partitions 4 

hadoop jar splout-hadoop-0.3.0-hadoop.jar deploy --root database-files --tablespaces city_pby_country_code \
  --replication 1 --qnode http://localhost:4412