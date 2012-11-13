## Laboratorium 2

Zadanie 1:

```sh
head -n 2 programc.c
```

Zadanie 2:
```sh
tail -n 4 program.c
```

Zadanie 3:
```sh
grep 'main' program.c
```

Zadanie 4:
```sh
chmod u=rw program.c
chmod g=r program.c
```


## Laboratorium 3

Zadanie 1:

```sh

Zadanie 9:

```sh
cat /etc/password | head -n 3 | wc -m
```

## Labolatorium 5

Zadanie 1:

```sh
find ~/ -maxdepth 1 -mtime -10
```

Zadanie 2:

```sh
find / -name \*config\* -type f 2> /dev/null
```

Zadanie 3:

```sh
find ~/ -atime 20
```

Zadanie 4:

```sh
find /etc\(-type d -and ! empty\) -or \(-type f -and -name a*\) 2> /dev/null
```


## Laboratorium 6

Zadanie 1:

```sh
grep . {1,} plik.txt
```

Zadanie 2:

```ssh
grep ^[0-9] pl*
```

Zadanie 3:

```sh
ls -1 | grep -E '.{8}r.'
```

Zadanie 4:

```ssh
grep -c bash /etc/passwd
```

Zadanie 5:

```ssh
grep [IVXLCDM] plik.txt
```