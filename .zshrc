SOURCE_NAME=${(%):-%N}
SOURCE=$( cd "$( dirname ${SOURCE_NAME} )" && pwd )
SOURCE_NAME=${SOURCE_NAME##*/}
SOURCE=${SOURCE}/${SOURCE_NAME}
if [[ -L ${SOURCE} ]]; then
    SOURCE=$(readlink ${SOURCE})
fi
dotfileDir=${SOURCE%/*}

# ZSH的环境变量 oh-my-zsh 安装位置
export ZSH=$HOME/.oh-my-zsh

#######################################################################
#                              主题设置                               #
#######################################################################
# 主题列表在 ~/.oh-my-zsh/themes/
# 详情请看 https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# 如果设置为 "random", 每次开启都会是不同的主题。例如 agnoster pygmalion。
# 在tmux配置文件中设置set -g default-terminal "screen-256color"
# 打开tmux 后TERM 的值就会是screen-256color
# xterm-256color 是在 iterm2 中设置返回终端类型
# "$TERM" = "screen-256color" || -n "$TMUX" || "$TERM" = "xterm-256color"
ZSH_THEME="pygmalion"

# 设置 ZSH_THEME = random 这个变量加载的主题列表
# 从这个数组变量中加载 zsh 主题而不是一个空数组
# ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" "bullet-train" )

# 取消注释以下行以区分大小写。
# CASE_SENSITIVE="true"

# 取消注释以下行以使用连字符不敏感完成。
# 敏感补全必须关闭。 _和 - 可以互换。
HYPHEN_INSENSITIVE="true"

# 如果不想要自动更新，可以取消注释下面的一行
# DISABLE_AUTO_UPDATE="true"

# 自动更新的时间间隔，单位是天，这里设置 13 天更新一次
# export UPDATE_ZSH_DAYS=13

# 如果不想要 ls 命令输出带颜色，可以取消注释下面的一行
# DISABLE_LS_COLORS="true"

# 是否禁止更改终端标题,禁止所有终端tab只显示zsh
# 且不随着目录的改变而改变显示
# DISABLE_AUTO_TITLE="true"

# 自动纠正命令
# ENABLE_CORRECTION="true"

# 按tab键补全命令的时候,如果没什么可补全的就会出现三个红点
COMPLETION_WAITING_DOTS="true"

# 取消注释，如果想不标记不追踪的文件
# 在版本控制目录下，使得大的版本库状态检测更加快
DISABLE_UNTRACKED_FILES_DIRTY="true"

# 历史命令日期显示格式
# 有三种方式: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# zsh插件安装，方便在各个系统环境中安装
zshPlugins=(
zsh-autosuggestions     # zsh 智能提示
zsh-completions         # zsh 补全
zsh-syntax-highlighting # zsh 高亮插件
)

for plugin in ${zshPlugins[@]}; do
    grep -q git `which git`
    if [[ $? -eq 0 && ! -e $ZSH/plugins/${plugin} ]]; then
        git clone https://github.com/zsh-users/${plugin} $ZSH/plugins/${plugin}
    fi
done

# 任何你想要加载的插件 (可在 ~/.oh-my-zsh/plugins/* 中找到)
# 自定义插件可能被添加到 ~/.oh-my-zsh/custom/plugins/
# 例子格式: plugins=(rails git textmate ruby lighthouse)
# 终端插件启用 enable ，如果添加太多启动速度会比较慢
plugins=(
git                     # git 命令别名alias
github                  # 为github gem 添加自动补全功能，可以通过gem install github安装
jira
osx                     # cdf 切换命令行目录到finder显示目录，ofd 打开命令行地址到目录，pfs 返回finder选择的文件或目录。pfd返回最先打开的finder的位置，showfiles，hidefiles，quick-look， man-preview
pip3
proxychains4            # brew 代理下载，解决网络问题
python                  # python解释器的补全
sudo                    # 通过双击 ESC 在命令最前面添加 sudo
vagrant                 # 可以为你提供可配置、可再生、便携的工作环境
web-search              # [baidu|google|bing|ddg] 用什么搜索引擎[百度|谷歌|必应|duckduckgo]
zsh-autosuggestions     # 智能提示输入 ctrl-f 确认补全, alt-f 补全单词
zsh-completions
zsh-syntax-highlighting # 命令高亮插件
)

source $ZSH/oh-my-zsh.sh

# 用户配置

export MANPATH="/usr/local/man:$MANPATH"

# 您可能需要手动设置您的语言环境
# export LANG=zh_CN.UTF-8

# git centos 等系统中文乱码解决
export LESSCHARSET=utf-8

# 本地和远程会话的首选编辑器
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# 编译标志
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

#######################################################################
#                            环境变量配置                             #
#######################################################################

# 设置个人别名，覆盖由oh-my-zsh库提供的个人别名
# 别名可以放在 env.sh 中利用管理
# 有关活动别名的完整列表，请运行“alias”。

# aliases 命令别名自定义 ---------------------------------------------------------

alias cls='clear'
alias grep="grep --color=auto"
alias javac="javac -J-Dfile.encoding=utf8"
alias la='ls -a'
alias ll='ls -l'
alias tmux='tmux -2'
alias vi='vim'
alias pdf='mupdf-gl'

# 在命令行直接输入文件名后缀，会在 vim 中打开 ----------------------------------

# 用什么编辑器打开
export EDITOR='vim'

alias envconfig="${EDITOR} ${dotfileDir}/env.sh"
alias zshconfig="${EDITOR} ~/.zshrc"
alias ohmyzsh="${EDITOR} ~/.oh-my-zsh"

alias -s c=${EDITOR}
alias -s html=${EDITOR}
alias -s java=${EDITOR}
alias -s js=${EDITOR}
alias -s rb=${EDITOR}
alias -s txt=${EDITOR}

# 各种打包解压
alias -s bz2='tar -xjvf'
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'

# 功能增强----------------------------------------------------------------------

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# macvim 中启用终端模拟器的时候，解决智能提示白色的问题
export TERM=xterm-256color
