#!/usr/bin/env zsh

source ~/.zplug/init.zsh
# Make sure to use double quotes
zplug "zsh-users/zsh-autosuggestions"     # 智能提示输入 ctrl-f 确认补全, alt-f 补全单词
zplug "zsh-users/zsh-completions"         # 命令补全，通过 tab 键
zplug "zsh-users/zsh-syntax-highlighting" # 命令高亮插件
zplug "skywind3000/z.lua"                 # 智能目录跳转

# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
# zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# Can manage everything e.g., other person's zshrc
# zplug "tcnksm/docker-alias", use:zshrc

# Disable updates using the "frozen" tag
# zplug "k4rthik/git-cal", as:command, frozen:1

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

# # Supports oh-my-zsh plugins and the like

# git 命令别名alias
zplug "plugins/git",    from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/yarn",   from:oh-my-zsh
# cdf 切换命令行目录到 finder 显示目录
# ofd 打开命令行地址到目录
# pfs 返回finder选择的文件或目录
# pfd返回最先打开的finder的位置
# 显示/隐藏文件 showfiles, hidefiles
# quick-look, man-preview
zplug "plugins/sudo",    from:oh-my-zsh
# ta: tmux attach -t
# tad: tmux attach -d -t
# tkss: tmux kill-session -t
# tksv: tmux kill-server
# tl: tmux list-sessions
# ts: tmux new-session -s
zplug "plugins/npm",     from:oh-my-zsh
# [baidu|google|bing|ddg] 用什么搜索引擎[百度|谷歌|必应|duckduckgo]
# zplug "plugins/web-search",     from:oh-my-zsh

# 为github gem 添加自动补全功能，可以通过gem install github安装
# antigen bundle github

# Also prezto
# zplug "modules/prompt", from:prezto

# Load if "if" tag returns true
# zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# Run a command after a plugin is installed/updated
# Provided, it requires to set the variable like the following:
# ZPLUG_SUDO_PASSWORD="********"
# zplug "jhawthorn/fzy", \
#     as:command, \
#     rename-to:fzy, \
#     hook-build:"make && sudo make install"

# Supports checking out a specific branch/tag/commit
# zplug "b4b4r07/enhancd", at:v1
# zplug "mollifier/anyframe", at:4c23cb60

# Can manage gist file just like other packages
# zplug "b4b4r07/79ee61f7c140c63d2786", \
#     from:gist, \
#     as:command, \
#     use:get_last_pane_path.sh

# Support bitbucket
# zplug "b4b4r07/hello_bitbucket", \
#     from:bitbucket, \
#     as:command, \
#     use:"*.sh"

# Rename a command with the string captured with `use` tag
# zplug "b4b4r07/httpstat", \
#     as:command, \
#     use:'(*).sh', \
#     rename-to:'$1'

# Group dependencies
# # Load "emoji-cli" if "jq" is installed in this example
# zplug "stedolan/jq", \
#     from:gh-r, \
#     as:command, \
#     rename-to:jq

# zplug "b4b4r07/emoji-cli", \
#     on:"stedolan/jq"

# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
# zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Can manage local plugins
# zplug "~/.zsh", from:local

# Load theme file
zplug "mafredri/zsh-async", from:github, use:"async.zsh"
zplug "sindresorhus/pure", from:github, use:"pure.zsh", as:theme, if:"[[ $OSTYPE == *linux* ]]"
# zplug "dracula/zsh", from:github, use:"dracula.zsh-theme", as:theme, if:"[[ $OSTYPE == *darwin* ]]"

# Install plugins if there are plugins that have not been installed
    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

# Then, source plugins and add commands to $PATH
zplug load

ZPLUG=~/.zplug/repos
#######################################################################
#                        oh-my-zsh 设置                               #
#######################################################################

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
#   export EDITOR='nvim'
# fi

# 编译标志
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

if [[ -e $ZPLUG/robbyrussell/oh-my-zsh/oh-my-zsh.sh ]]; then
    source $ZPLUG/robbyrussell/oh-my-zsh/oh-my-zsh.sh
fi
eval "$(lua $ZPLUG/skywind3000/z.lua/z.lua  --init zsh once enhanced)"

#######################################################################
#                            环境变量配置                             #
#######################################################################

# macvim 中启用终端模拟器的时候，解决智能提示白色的问题
export TERM=xterm-256color
export _ZL_ROOT_MARKERS=".git,.svn,.hg,.root,package.json"

# 设置个人别名，覆盖由 `oh-my-zsh` 库提供的个人别名
# 有关活动别名的完整列表，请运行 "alias"。

# aliases 命令别名自定义 ---------------------------------------------------------

# alias -g zplug="LC_MESSAGES=en_US.UTF-8 zplug"

alias cls='clear'
alias grep='grep --color=auto'
alias javac='javac -J-Dfile.encoding=utf8'
alias la='ls -a'
alias ll='ls -l'
alias tmux='tmux -2'
alias vi='vim -u ~/dotfiles/.vim/init-min.vim'
alias v='vim -u ~/dotfiles/.vim/init-no-plugin.vim'
alias lc=leetcode

# z 命令别名
alias zc='z -c' # 严格匹配当前路径的子路径
alias zz='z -i' # 使用交互式选择模式
alias zf='z -I' # 使用 fzf 对多个结果进行选择
alias zb='z -b' # 快速回到父目录

# 在命令行直接输入文件名后缀，会在 vim 中打开 ----------------------------------

# 用什么编辑器打开
export EDITOR='vim'

alias zshconfig='${EDITOR} ~/.zshrc'
alias ohmyzsh='${EDITOR} ${ZPLUG}/robbyrussell/oh-my-zsh/oh-my-zsh.sh'
alias typora='open -a typora'

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
