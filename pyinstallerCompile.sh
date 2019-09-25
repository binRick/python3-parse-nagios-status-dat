#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
python3 -m venv .venv
rm -rf build dist test.spec parseNagiosStatus
source .venv/bin/activate
pip install pip --upgrade
pip install pyinstaller PyCrypto

pyinstaller \
    --onefile --name parseNagiosStatus \
    --key=8328274898256634 \
    --clean \
        parseNagiosStatus.py


mv dist/parseNagiosStatus parseNagiosStatus-pyinstaller
rm -rf build dist test.spec __pycache__
