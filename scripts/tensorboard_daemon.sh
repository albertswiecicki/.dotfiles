#!/bin/bash
# script from: https://github.com/tensorflow/tensorboard/issues/867 by DeanChan
trap ctrl_c INT
function ctrl_c() {
        echo 
	echo "Ctrl-C by user"
	kill -9 $pid
	exit
}
args=$@
while true
do
	eval "tensorboard $args > /dev/null 2>&1 &"
	pid=$!
	echo "tensorboard running on $pid"
	sleep 60
	kill -9 $pid
done
