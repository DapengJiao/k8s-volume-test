#!/usr/bin/env bash

echo '>>>>>>>>>>>>>> Start to run ioping testing >>>>>>>>>>>>>>'
ioping -c 100 .

echo '>>>>>>>>>>>>>> Start to warm up disk >>>>>>>>>>>>>>'
dd if=/dev/zero of=/mnt/pv/test.img bs=1G count=1 oflag=dsync

echo '>>>>>>>>>>>>>> Start to run fio testing >>>>>>>>>>>>>>'
fio --randrepeat=1 --ioengine=libaio --gtod_reduce=1 --name=test --filename=/mnt/pv/test.img --bs=4k --iodepth=64 --size=1G --readwrite=randrw --rwmixread=75
