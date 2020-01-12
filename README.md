# vim 及 zsh 配置安装

在 `centos`、`ubuntu`、`mac`、`arch linux` 中安装 vim

```bash
$ brew    install vim # mac：需要安装 brew 命令行工具
$ yum     install vim # centos
$ apt-get install vim # ubuntu
$ pacman  -Sy     vim # arch linux
```

如果你不想自己单独配置，或嫌配置麻烦，可以通过下面代码运行（不包括$）。需要提前
下载 curl、git。

[ycm 中文](https://ycm-wiki-zhcn.readthedocs.io/zh_CN/latest/official_doc/intro.html)

[ycm 英文](https://github.com/ycm-core/YouCompleteMe)

```bash
$ git clone https://github.com/qw9002/dotfiles.git ~/ # 配置文件下载
$ cd ~/dotfiles                                       # 进入配置文件
$ ./install                                           # 环境所需软件安装、配置
$ vim +PlugUpdate +qall                               # 安装 vim 配置插件
```


### ZSH

切换 `zsh` 作为第一 `shell`。

使用软件管理工具 (brew、yum、apt-get、pacman) 下载安装 zsh。

```bash
$ brew install zsh          # centos
$ cat /etc/shells           # 查看系统中的 shells
$ sudo chsh -s $(which zsh) # 切换默认 bash 到系统默认 zsh
```
