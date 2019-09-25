#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
python3 -m venv .venv
rm -rf build dist test.spec parse-nagios-status
source .venv/bin/activate
pip install pip --upgrade
pip install pyinstaller PyCrypto
#    -d all \
pyinstaller \
    --onefile --name parse-nagios-status \
    --key=8328274898256634 \
    --clean \
        parse-nagios-status.py



mv dist/parse-nagios-status parse-nagios-status

rm -rf build dist test.spec __pycache__
~
