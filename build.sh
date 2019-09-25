#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
python3 -m venv .venv
rm -rf build dist test.spec
source .venv/bin/activate
pip install pip --upgrade
pip install pyinstaller PyCrypto
pyinstaller \
    --onefile --name parse-nagios-status \
    --key=8328274898256634 \
        parse-nagios-status.py
