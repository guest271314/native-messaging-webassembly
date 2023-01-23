#!/bin/bash
while pgrep -f nm_c_wat.sh > /dev/null
do
  sleep 1
done
killall -9 wasmtime
exit 0
