#!/bin/bash
rm -rf .venv-cython
set -e
python3 -m venv .venv-cython
source .venv-cython/bin/activate
pip install pip --upgrade
pip install git+ssh://git@github.com/binRick/python3-parse-nagios-status-dat.git@master

pip install Cython
rm -rf parseNagiosStatus.c parseNagiosStatus parseNagiosStatus-cython
cython -3 --embed -o parseNagiosStatus.c parseNagiosStatus.py
gcc -Os -I /usr/include/python3.6m -o parseNagiosStatus parseNagiosStatus.c -lpython3.6m -lpthread -lm -lutil -ldl
rm -rf parseNagiosStatus.c
mv parseNagiosStatus parseNagiosStatus-cython
ls -al parseNagiosStatus-cython
