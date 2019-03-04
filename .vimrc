" 设置通用前缀空格键
let mapleader="\<Space>"

" 保存配置，并实时加载到系统环境当中去----------------------------------------
nnoremap <silent> <leader>sv :w!<cr> :source %<cr>

" 调用man程序在vim内部查看命令
runtime ftplugin/man.vim

" 字体编码猜测优先顺序
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" 编码设置
set encoding=utf-8

" 插件安装配置文件和提高效率小技巧--------------------------------------------

" 跳转到该文件，通过游标聚焦在bundles.vim路径上按gf键跳转至文件，再通过C-O回跳
" 插件的配置文件，把基本配置和插件配置分开
source ~/.vim/config/plug.vim
" 基本方法，技巧配置
source ~/.vim/config/config.vim

" 基本配置--------------------------------------------------------------------

" 搜索后直接高亮匹配项目
set incsearch

" 设置横屏/纵屏分屏默认位置
set splitbelow
set splitright

" 静音🔇
set visualbell

" 使文件在修改后（不保存），能够使用命令在缓存文件之间跳转
set hidden

" 显示行数字
set number
" set relativenumber

" 开启语法高亮，根据文件类型侦测。on 使用默认配色
syntax enable on

" 智能缩进
set autoindent

" 底层状态栏
set laststatus=2

" 状态栏显示命令
set showcmd

" 状态栏显示模式
set showmode

" 使用 tab 自动转化成空格展开
set expandtab

" 指定的文件用 tab 键时不转化为空格，例如makefile
set smarttab

" 一行字宽超过屏幕显示不换行显示
set nowrap

" 在 Insert 模式下，设置 Backspace 键如何删除光标前边的字符。
" 这里三个值分别表示空白字符，分行符和插入模式之前的字符。
set backspace=indent,eol,start

" longest 最长匹配，list 匹配列表，full 匹配队列
" set wildmode=longest,list,full
set wildmode=full

" 无需缓存文件
set noswapfile

" 无需备份
set nobackup

" 设置鼠标功能
set mouse=a
