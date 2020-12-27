#!/bin/bash

sudo apt-get update >> /dev/null 2>&1 &
while wait; do
  echo waitting
done
echo done

