#!/usr/bin/env python3
import re, json, os, requests, urllib3, time
import parse_nagios
from halo import Halo




if __name__ == "__main__":
    spinner = Halo(text='Loading', spinner='dots')
    spinner.start()
    time.sleep(3)
    spinner.stop()
    print(json.dumps(parse_nagios.read_status()))
