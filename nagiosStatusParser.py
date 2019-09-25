#!/usr/bin/env python3
import re, json, os
STATUS_FILE_PATH = "/var/log/nagios/status.dat"

def read_status():
    if not os.path.exists(STATUS_FILE_PATH):
        raise Exception("Unable to read file {}".format(STATUS_FILE_PATH))
    hosts = {}
    services = {}
    fh = open(STATUS_FILE_PATH)
    status_raw = fh.read()
    pattern = re.compile('([\w]+)\s+\{([\S\s]*?)\}',re.DOTALL)
    matches = pattern.findall(status_raw)
    for def_type, data in matches:
        lines = [line.strip() for line in data.split("\n")]
        pairs = [line.split("=", 1) for line in lines if line != '']
        data = dict(pairs)
        if def_type == "servicestatus":
            services[data['service_description']] = data
            if 'host_name' in data:
                hosts[data['host_name']]['services'].append(data)
        if def_type == "hoststatus":
            data['services'] = []
            hosts[data['host_name']] = data
    return {
        'hosts': hosts,
        'services': services,
    }

if __name__ == "__main__":
    print(json.dumps(read_status()))
