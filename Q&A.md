### Mac 电脑 -> 系统偏好设置 -> 用户与群组 -> 高级选项 中更改信息导致无法解锁系统设置？
开机的时候按住 command+s 出现命令行终端的时候按照以下顺序输入命令：

```bash
/sbin/mount -uaw
rm var/db/.applesetupdone
reboot **
```

reboot（重启）完成后，创建一个新的用户，按照提示操作。新用户创建后，打开 系统偏好设置 -> 用户与群组 点击原来的普通用户，右侧有个“允许用户管理这台电脑”， 打勾然后重启。这样就可以以管理员的身份登录到你原来的系统，再把刚新创建的管理员账户删除就可以了。

### centos ubuntu 系统下安装编译vim

支持python
./configure --with-features=huge \
--enable-multibyte \
--enable-pythoninterp=yes \
--with-python-config-dir=/usr/lib64/python2.7/config \
--prefix=/usr/local

支持python3
./configure --with-features=huge \
--enable-multibyte \
--enable-python3interp=yes \
--with-python-config-dir=/usr/python3/lib/python3.6/config-3.6m-x86_64-linux-gnu \
--prefix=/usr/local

make
make install 

#### global 6.6.3 (gtags gtags-scope) 安装编译

centos 需要
autoconf automake bison flex gperf libtool libtool-ltdl-devel texinfo

ubuntu 需要
autoconf automake bison flex gperf libtool-bin texinfo

```bash
$ wget http://tamacom.com/global/global-6.6.3.tar.gz
$ sh reconf.sh 
$ ./configure
$ make
$ make install
```

#### universal-ctags 安装编译

ubuntu需要 pkg-config

```bash
$ git clone https://github.com/universal-ctags/ctags
$ ./autogen.sh
$ #  --prefix=/where/you/want # defaults to /usr/local
$ ./configure
$ make
$ make install # may require extra privileges depending on where to install
```

### docker

--cap-add: Add Linux capabilities
--cap-drop: Drop Linux capabilities
--privileged=false: Give extended privileges to this container
--device=[]: Allows you to run devices inside the container without the --privileged flag.

```bash
docker build -t dockerName .
docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined  -it dockerName
```

#### git 颜色

颜色支持
git config --global color.status auto
git config --global color.diff auto
git config --global color.branch auto
git config --global color.interactive auto

#### gdb 编译安装


#### 复制/修改，可视区域标记

使用 ' ` 跳转位置

```
' 跳转前的位置
" 最后修改(离开缓冲区)的位置
[ 修改开始的位置
] 修改结束的位置
^ 上次插入模式关闭的位置
. 上次最后改变的位置(粘贴时为粘贴第一个字符)

< 可是模式匹配开始的位置
> 可是模式匹配结束的位置

```

#### 列表 跳转列表 "`'"、改变修改列表 g; g,、
