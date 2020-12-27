#!/bin/bash

sudo bash -c 'apt-get -y upgrade >> /dev/null 2>&1 & disown'
wait
echo done
