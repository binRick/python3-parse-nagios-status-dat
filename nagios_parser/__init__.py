import re, json, os, sys
STATUS_FILE_PATH = "/var/log/nagios/status.dat"

def read_status():
    hosts = []
    services = []
    programstatus = {}
    fh = open(STATUS_FILE_PATH)
    status_raw = fh.read()
    pattern = re.compile('([\w]+)\s+\{([\S\s]*?)\}',re.DOTALL)
    matches = pattern.findall(status_raw)
    for def_type, data in matches:
        lines = [line.strip() for line in data.split("\n")]
        pairs = [line.split("=", 1) for line in lines if line != '']
        P = []
        for p in pairs:
            if len(p) == 2:
               P.append(p)
        data = dict(P)
        if def_type == "servicestatus":
            services.append(data)
        if def_type == "hoststatus":
            hosts.append(data)
        if def_type == "programstatus":
            programstatus = data
    return {
        'hosts': hosts,
        'services': services,
        'programStatus': programstatus,
    }

if __name__ == "__main__":
    print(json.dumps(read_status()))
