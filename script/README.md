# "set" Command && “shopt” Command

## set -u
- 默认情况下我们的`shell script` 在执行的时候，遇到不存在的变量，`bash`会默认忽略掉这个变量
```shell
#!/usr/bin/env bash

echo ${name}

echo "name"

```

- 执行这段脚本，输出了一个空行，`Bash` 忽略了不存在的变量`name`
- 大多数情况下，这不是开发者想要的行为，遇到变量不存在，脚本应该报错，而不是一声不响地往下执行。
- set -u就用来改变这种行为。脚本在头部加上它，遇到不存在的变量就会报错，并停止执行。

```shell
./test.sh: line 4: name: unbound variable
```
- `-u`还有另一种写法`-o nounset`，两者是等价的。

## set -x

- 默认情况下，脚本执行后，只输出运行结果，没有其他内容。如果多个命令连续执行，它们的运行结果就会连续输出。有时会分不清，某一段内容是什么命令产生的。
- `set -x`用来在运行结果之前，先输出执行的那一行命令。
- `-x`还有另一种写法`-o xtrace`

## set -e
- 如果脚本里面有运行失败的命令（返回值非0），Bash 默认会继续执行后面的命令。
- 这种行为很不利于脚本安全和除错。实际开发中，如果某个命令失败，往往需要脚本停止执行，防止错误累积。
```shell
command || exit 1
```
- 上面的写法表示只要`command`有非零返回值，脚本就会停止执行。
- `set -e`从根本上解决了这个问题，它使得脚本只要发生错误，就终止执行。
- `set +e`表示关闭`-e`选项，`set -e`表示重新打开`-e`选项
- `-e`还有另一种写法`-o errexit`。

## set -o pipefail

- `set -e`有一个例外情况，就是不适用于管道命令。
- 所谓管道命令，就是多个子命令通过管道运算符（|）组合成为一个大的命令。Bash 会把最后一个子命令的返回值，作为整个命令的返回值。也就是说，只要最后一个子命令不失败，管道命令总是会执行成功，因此它后面命令依然会执行，set -e就失效了
- `set -o pipefail`用来解决这种情况，只要一个子命令失败，整个管道命令就失败，脚本就会终止执行
```shell
#!/usr/bin/env bash
set -eo pipefail

```

## Other

- set命令还有一些其他参数。

  - set -n：等同于set -o noexec，不运行命令，只检查语法是否正确。
  - set -f：等同于set -o noglob，表示不对通配符进行文件名扩展。
  - set -v：等同于set -o verbose，表示打印 Shell 接收到的每一行输入。
  - set -o noclobber：防止使用重定向运算符>覆盖已经存在的文件。
  - 上面的-f和-v参数，可以分别使用set +f、set +v关闭。
- mysterious abbreviation
  - LGTM: Look Good To Me（我知道了，代码review过，可以合并）
  - SGTM: Sounds Good To Me （和LGTM一样，也是通过reveiw，可以合并）
  - PTAL: Please Take A Look（你来瞅瞅，用来提示别人来看一下）
  - TBR: To Be Reviewed（提示维护者进行review）
  - TL,DR: Too Long，Didn‘t Read（太长懒得看，也有很多文档在简略描述中会写这个）
  - CC: Carbon Copy （抄送）
  - FYI: For You Informations（仅供参考，一般用于和你关系不大，但是需要了解，看看就好）
- abbreviation
  - BTW: By The Way（顺便说一下）
  - QA：Quality Assurance（质量保证）
- Must know words
  - Stand up meeting：非正式短会
  - stream         溪流
  - upstream     上游
  - Certificate    证书
  - privileged    特权
  - Introduction    介绍
  - Overview    概述
  - extension    扩展
  - predefined    预定义的
  - Launch        发射，发动
  - Community        社区
  - Submitting patches        提交补丁
  - License        执照，许可
  - Related resources        相关资源
  - Technical Overview        技术概述
  - Updating Dependencies        更新依赖
  - upgrade            升级
  - generated        生成
  - Requirements        要求
  - Demo    演示
  - daemon        守护进程
  - Support        支持
  - Production-Grade Container Scheduling and Management        生产级别的容器调度和管理
  - To start using K8s        开始使用k8s
  - To start developing K8s    开始开发k8s
  - Roadmap        路线图
  - repo        回购
  - report        报告
  - repost        转发
  - repository        存储库
  - Adopters        采用者
  - designed        设计的
  - fabric             结构
  - details            细节
  - backends        后端
  - region            地区
  - architecture            架构
  - binary                        二进制
  - process calls            进程调用
  - official                    官方
  - objective                    目标
  - ksy results                关键结果
  - plugin                        插件
  - ingress                        入口
  - egress                        出口
  - Whitelist                    白名单
  - drive                            驱动
  - device                        设备
  - foreword                    前言

