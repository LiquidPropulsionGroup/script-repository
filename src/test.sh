#!/bin/bash

sudo apt-get update >> /dev/null 2>&1 &
wait
echo done
