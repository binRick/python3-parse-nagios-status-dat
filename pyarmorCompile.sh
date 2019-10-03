#!/bin/bash
rm -rf .venv-pyarmor PACKED
set -e

python3 -m venv .venv-pyarmor


source .venv-pyarmor/bin/activate
pip install pip --upgrade
pip install pyarmor pyinstaller \
            git+https://github.com/binRick/python3-parse-nagios-status-dat.git@master \
            requests urllib3 halo ansible

pyarmor -v
if [ "$PYARMOR_CODE" != "" ]; then
    echo "Registering pyArmor Code.."
    pyarmor register $PYARMOR_CODE
    pyarmor -v
fi


time pyarmor pack -e " --onefile " -O PACKED -t PyInstaller --clean parseNagiosStatus.py


#python3 .venv-pyarmor/lib64/python3.6/site-packages/pyarmor/pyarmor.py obfuscate -r \
#    -O PACKED/obf/dist --exclude PACKED ./parseNagiosStatus.py
#python3 -m PyInstaller --distpath PACKED --onefile -y \
#   --add-data PACKED/obf/dist/pytransform.key:. --add-binary PACKED/obf/dist/_pytransform.*:. \
#   --add-data PACKED/obf/dist/license.lic:. ./parseNagiosStatus.py PACKED/obf/dist/parseNagiosStatus.py
#python3 -m PyInstaller --distpath PACKED --onefile -y parseNagiosStatus-patched.spec

mv PACKED/parseNagiosStatus parseNagiosStatus-pyarmor
rm -rf PACKED

ls -al parseNagiosStatus-pyarmor
ldd parseNagiosStatus-pyarmor

