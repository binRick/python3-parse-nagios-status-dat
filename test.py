#!/usr/bin/env python3
import os, json, nagios_parser

print(json.dumps(nagios_parser.read_status()))
