#!/usr/bin/env python3
import re, json, os, requests, urllib3
import parse_nagios

if __name__ == "__main__":
    print(json.dumps(parse_nagios.read_status()))
