#!/bin/bash
# args:
# arg1: network address eg. user@university.edu
# arg2: host ports to bind eg: 8000
# arg3: local ports to bind 8000
# arg4: number of ports to bind
ports=""
for i in $(seq 0 $4); do ports+=" -L $(($3+$i)):localhost:$(($2+$i))"; done
echo ssh -N $ports $1
eval ssh -N $ports $1
