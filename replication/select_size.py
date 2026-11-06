"""Select one candidate for all single-case benches and the LTspice drawing."""
from pathlib import Path
import json, sys

root=Path(__file__).resolve().parent
cases=json.loads((root/'sizing_cases.json').read_text())
if len(sys.argv)!=2 or not sys.argv[1].isdigit():
    print('Usage: python select_size.py CASE_NUMBER')
    for c in cases: print(c['case'],c['name'])
    raise SystemExit(1)
chosen=next((c for c in cases if c['case']==int(sys.argv[1])),None)
if chosen is None: raise SystemExit('Unknown case number.')
lines=[f"* Active case {chosen['case']}: {chosen['name']}",f".param CASE_ID={chosen['case']}"]
for g in ['IN','TAIL','RST','PREG','CAS','NREG']:
    lines.append(f".param W_{g}={chosen['params']['W_'+g]:.9g} L_{g}={chosen['params']['L_'+g]:.9g}")
(root/'sizing.inc').write_text('\n'.join(lines)+'\n',encoding='ascii')
print('Selected',chosen['case'],chosen['name'])
print('Rerun 01_functional.sp and all analysis benches. Old results are stale.')
