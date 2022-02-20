# cover-set-problem solver encoded in ASP

Answer Set Programming encoding of the [cover set problem](https://en.wikipedia.org/wiki/Set_cover_problem).

> Given a set of elements { 1 , 2 , . . . , n } {\{1,2,...,n\}} \{1,2,...,n\} (called the universe) and a collection S {S} S of m {m} m sets whose union equals the universe, the set cover problem is to identify the smallest sub-collection of S {S} S whose union equals the universe. For example, consider the universe U = { 1 , 2 , 3 , 4 , 5 } {U=\{1,2,3,4,5\}} U=\{1,2,3,4,5\} and the collection of sets S = { { 1 , 2 , 3 } , { 2 , 4 } , { 3 , 4 } , { 4 , 5 } } {S=\{\{1,2,3\},\{2,4\},\{3,4\},\{4,5\}\}} S=\{\{1,2,3\},\{2,4\},\{3,4\},\{4,5\}\}. Clearly the union of S {S} S is U {U} U. However, we can cover all of the elements with the following, smaller number of sets: { { 1 , 2 , 3 } , { 4 , 5 } } {\{\{1,2,3\},\{4,5\}\}} \{\{1,2,3\},\{4,5\}\}. 

## Dependencies for this repository

For ```gen.py```.

**Python 3**
```bash
apt-get install python3
```

For running the ASP solution of the problem.

**clingo** [docs](https://potassco.org/clingo/)
```bash
python3 -m pip install clingo
```

## Generation of random problem instances

```
gen.py
  Generates a ASP programs representing an instance of the
  set cover problem encoded in Answer Set Programming.
  Uses the standard output.
usage:
  - python3 gen.py N_SETS N_ELEMENTS
  - ./gen.py N_SETS N_ELEMENTS

```

Example of usage:

The following generates a random instance using 3 Sets and 4 elements
```bash
python3 gen.py 3 4 > case_3_4.lp
```

in the following format.
```
% 4X3 (setsXelements)
inc(s0, d0).

inc(s1, d0).
inc(s1, d2).

inc(s2, d2).

inc(s3, d0).
inc(s3, d2).

inc(s4, d1).
```

The previous example would represent the following instance.

|        | **d0** | **d1** | **d2** |
| :----: | :----: | :----: | :----: |
| **s0** |   X    |        |   X    |
| **s1** |        |        |   X    |
| **s2** |   X    |        |        |
| **s3** |        |   X    |        |

Whose solution would be ```S={s0, s3}```.

## ASP encoding usage

Normal usage.
```bash
clingo 0 case_4_3.lp coverage.lp [essentials.lp] [needed.lp] minimize.lp --opt-mode=optN
```

Dynamically generating a random instance of the problem. In this case with 64 sets and 256 elements.
```bash
python3 gen.py 64 256 | clingo 0 coverage.lp [essentials.lp] [needed.lp] minimize.lp --opt-mode=optN -
```
