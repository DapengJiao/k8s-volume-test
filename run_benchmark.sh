#!/usr/bin/env bash

echo -e "\n>>>>>>>>>>>>>> Start to warm up disk >>>>>>>>>>>>>>\n"
dd if=/dev/zero of=/mnt/pv/test.img bs=1G count=1 oflag=dsync
echo -e "\n>>>>>>>>>>>>>> Start to run fio testing >>>>>>>>>>>>>>\n"
fio --randrepeat=1 --ioengine=libaio --gtod_reduce=1 --name=test --filename=/mnt/pv/test.img --bs=4k --iodepth=64 --size=1G --readwrite=randrw --rwmixread=75
echo -e "\n>>>>>>>>>>>>>> Start to run ioping testing >>>>>>>>>>>>>>\n"
ioping -c 20 .
