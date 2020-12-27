#!/bin/bash

sudo apt-get update >> /dev/null 2>&1 &
echo -ne '==========>          (50%)\r'
wait

sudo apt-get upgrade >> /dev/null 2>&1 &
echo -ne '===================> (90%)\r'
wait

echo -ne '====================>(100%)\r'
echo done
