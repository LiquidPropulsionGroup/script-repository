#!/bin/bash

sudo apt-get update >> /dev/null 2>&1 &
echo -ne '==========>          (50%)\r'
wait

sleep 10
sudo apt-get -y upgrade >> /dev/null 2>&1 &
echo -ne '===================> (90%)\r'
wait

sleep 10
echo -ne '====================>(100%)\r'
echo done
