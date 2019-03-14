## vim 及 zsh 配置安装

如果你不想自己单独配置，或嫌配置麻烦，可以通过下面代码运行（不包括$）。

```bash
$ git clone https://github.com/qw9002/dotfiles.git ~/ # 配置文件下载
$ cd ~/dotfiles                                       # 进入配置文件
$ ./install                                           # 环境所需软件安装、配置
```
`说明`：

该配置文件中有 vim 等配置文件

配置 `zsh` 作为第一 `shell`。

下载安装zsh

```bash
$ yum install zsh       # centos
$ apt-get install zsh   # ubuntu
$ brew install zsh      # mac
$ cat /etc/shells       # 查看系统中的 shells
$ sudo chsh -s /bin/zsh # 切换默认 bash 到系统默认 zsh
```
