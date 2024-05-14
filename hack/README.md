# Simple command summary


## generate random numbers
```shell
$ echo $RANDOM
$ echo $[RANDOM%50]

$ head -c 16 /dev/urandom | od -An -t x | tr -d ' '
$ openssl rand -base64 16

cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 32
```

## string length
```shell
$ echo "98fda3f8d7c9c981c09d21305be6d9bd" | wc -L
```

## VIM
```shell
zf " 创建折叠（先 Visual 模式选中）
zo "打开折叠
zc "关闭折叠
zR " 打开所有折叠
zM " 关闭所有折叠
```
## date
```shell
date +%F
date -d last-day +%Y-%m-%d
date -d yesterday +%Y-%m-%d
date -d next-day +%Y-%m-%d   
date -d tomorrow +%Y-%m-%d
date -d '2 days ago' +%Y-%m-%d
date -d '2 weeks ago' +%Y-%m-%d
date -d '2 months ago' +%Y-%m-%d
date -d '2 years ago' +%Y-%m-%d
date -d '2 days' +%Y-%m-%d
date -d '2 weeks' +%Y-%m-%d
date -d '2 months' +%Y-%m-%d
date -d '2 years' +%Y-%m-%d
date -d last-month +%Y-%m-%d
date -d next-month +%Y-%m-%d
date -d next-year +%Y-%m-%d
date +%Y-%m-%d-%H-%M
date +%Y-%-m-%d-%-H-%-M
```
## tr
```shell
# 只保留数字
$ echo "hello 123 world 45678" | tr -dc 0-9
# 随机数生成器
$ head -c 16 /dev/urandom  | od -An -t x | tr -d ' '
# 计算字符串长度
$ echo "MnjvD26gq4InDRjZ" | wc -L
16
$ echo "98fda3f8d7c9c981c09d21305be6d9bd" | wc -l
1
$ echo "98fda3f8d7c9c981c09d21305be6d9bd" | wc -L
32
```
