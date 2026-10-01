"""Print original instructions for named functions in a cached module."""
import argparse,json,re
from pathlib import Path
from lua51_disassemble import disassemble
ROOT=Path(__file__).resolve().parents[1]
ap=argparse.ArgumentParser();ap.add_argument('module');ap.add_argument('functions',nargs='*');ap.add_argument('--constants',action='store_true');args=ap.parse_args()
row=next(r for r in json.loads((ROOT/'analysis/review/inventory.json').read_text()) if r['name']==args.module)
if args.constants:
 for f in row['functions']:
  if not args.functions or any(n in args.functions for n in f['names']):
   print(f['path'],','.join(f['names']),json.dumps(f['constants'],ensure_ascii=False))
else:
 text=disassemble((ROOT/'reverse/lua-bytecode'/row['source']).read_bytes(),row['name'])
 for section in re.split(r'(?=; Function )',text):
  line=section.splitlines()[0] if section else ''
  names=line.split(':',1)[-1].strip().split(', ')
  if not args.functions or any(n in args.functions for n in names): print(section)
