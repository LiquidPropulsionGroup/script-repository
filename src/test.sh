#!/bin/bash

sudo bash -c 'apt-get update >> /dev/null 2>&1 & disown'
wait
echo done
