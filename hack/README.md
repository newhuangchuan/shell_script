# Simple command summary


## generate random numbers
```shell
$ echo $RANDOM
$ echo $[RANDOM%50]

$ head -c 16 /dev/urandom | od -An -t x | tr -d ' '

cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 32
```

## string length
```shell
$ $ echo "98fda3f8d7c9c981c09d21305be6d9bd" | wc -L
```

