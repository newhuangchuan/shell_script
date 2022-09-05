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

## VIM
```shell
zf " 创建折叠（先 Visual 模式选中）
zo "打开折叠
zc "关闭折叠
zR " 打开所有折叠
zM " 关闭所有折叠
```

