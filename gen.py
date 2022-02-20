#!/usr/bin/env python3
from sys import argv
from random import getrandbits

def usage():
    print('gen.py')
    print('  Generates a ASP programs representing an instance of the')
    print('  set cover problem encoded in Answer Set Programming.')
    print('  Uses the standard output.')
    print('usage:')
    print('  - python3 gen.py N_SETS N_ELEMENTS')
    print('  - ./gen.py N_SETS N_ELEMENTS')

try:
    n_sets, n_elements = int(argv[1]), int(argv[2])
except:
    usage()
    exit(1)

setless = [1] * n_elements  # Elements not covered by any set

print(f'% {n_sets}X{n_elements} (setsXelements)')
for s in range(n_sets-1):
    for e in range(n_elements):
        if getrandbits(1):  # Random true or false
            print(f'inc(s{s}, d{e}).')
            setless[e] = 0
    print()

for e in range(n_elements):
    if setless[e]:
        print(f'inc(s{s+1}, d{int(e)}).')
