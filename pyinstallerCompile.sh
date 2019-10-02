#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
rm -rf .venv-pyinstaller
python3 -m venv .venv-pyinstaller
rm -rf build dist test.spec parseNagiosStatus
source .venv-pyinstaller/bin/activate
pip install pip --upgrade
#pip install PyCrypto
pip install pyinstaller
pip install pycryptodome

#    --key=8328274898256634 \
pyinstaller \
    --onefile --name parseNagiosStatus \
    --clean \
        parseNagiosStatus.py


mv dist/parseNagiosStatus parseNagiosStatus-pyinstaller
rm -rf build dist test.spec __pycache__
