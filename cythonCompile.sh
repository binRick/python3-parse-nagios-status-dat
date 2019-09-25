#!/bin/bash
rm -rf parseNagiosStatus.c parseNagiosStatus
set -e
cython -3 --embed -o parseNagiosStatus.c parseNagiosStatus.py
gcc -Os -I /usr/include/python3.6m -o parseNagiosStatus parseNagiosStatus.c -lpython3.6m -lpthread -lm -lutil -ldl
