" 不兼容 vi
set nocompatible
filetype off

" 插件的存放的根文件夹一律在~/.vim/bundle/下
" plug管理插件软件开始运行
call plug#begin('~/.vim/bundle')

" 打开关闭折叠效果 za
"  基本文本操作功能的增强 {{{

" 异步命令, 并将结果发乳quickfix窗口中
Plug 'skywind3000/asyncrun.vim'
" 自动打开 quickfix window ，高度为 10
let g:asyncrun_open = 10
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 tpope 插件系列                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 为其他插件提供重复操作'.'功能
Plug 'tpope/vim-repeat'

" 通过gcc添加或撤销注释
Plug 'tpope/vim-commentary'

" 提供遍历 [b 缓存,[q quickfix 快速修改,[a args 参数列表,[l location,[t tags
" 遍历文件 [f ]f 遍历，git conflict [n ]n
" vim常用设置项 yon 显示数字，yoh 显示高亮，yol 显示不可见字符...
" [<space> 向上增加空行 ]<space> 向下增加空行 ]e [e 交换上下行
" 解码或编码特殊文件字符 xml|html ]x [x   url ]u [u  c风格字符串输出格式 ]y [y
" 普通模式 [<>=][Pp] 缩进粘贴 插入粘贴模式 y[oO] <ctrl-v> -- 不自动增加缩进 
Plug 'tpope/vim-unimpaired'

" 添加／删除／改变成对符号 ds, ys, cs, 可视模式使用 S 作为前缀
Plug 'tpope/vim-surround' 

" vim 的git版本控制命令包装
Plug 'tpope/vim-fugitive'

" fugitive功能拓展
Plug 'gregsexton/gitv', { 'on': ['Gitv'] }

" 异步实时在左测显示符号状态列
Plug 'mhinz/vim-signify'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   motion                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Lokaltog/vim-easymotion'
map <leader> <plug>(easymotion-prefix)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             支持自定义文本对象                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'kana/vim-textobj-user'
" 增加行文本对象: l   dal yal cil
Plug 'kana/vim-textobj-line'
" 增加文件文本对象: e   dae yae cie
Plug 'kana/vim-textobj-entire'
" 增加缩进文本对象: i   dai yai cii - 相同缩进属于同一块
Plug 'kana/vim-textobj-indent'
" 高亮文本对象: y day yay ciy
Plug 'kana/vim-textobj-syntax'
" 函数文本对象: f daf yaf cif
Plug 'kana/vim-textobj-function', { 'for': [ 'c', 'cpp', 'vim', 'java' ] }
" 函数参数文本对象: da, ya, ci,
Plug 'sgur/vim-textobj-parameter'
let g:vim_textobj_parameter_mapping = ','
" 正则匹配单词的一部分，提供操作可以用operate + (? or i)/（正则模式类型）
Plug 'kana/vim-textobj-lastpat'

" 可视模式下用 * 号匹配字符串
Plug 'nelstrom/vim-visual-star-search'
" 筛选符合条件的 argslist 文件并保存到 args 中去, 使用 argdo 处理匹配文件
Plug 'nelstrom/vim-qargs'

" }}}

" 语法检测{{{
Plug 'w0rp/ale'
" c 或 c++ 需要指定语法分析工具，否则会显示重复的两条数据
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'html': ['tidy'],
            \   'c': ['clang'],
            \   'cpp': ['clang']
            \}
" 错误提示符及警告提示符
let g:ale_sign_error='✗'
let g:ale_sign_warning='⚠'

" }}}

" 窗口显示管理，美化布置 {{{

" 状态栏效果显示 airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

" 目录管理nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" 设置显示／隐藏标签列表
nnoremap <leader>8 :NERDTreeToggle<cr>

" nerdtree 插件显示修改状态
Plug 'Xuyuanp/nerdtree-git-plugin'

" }}}

" 工具拓展{{{

" 预览命令行命令效果
Plug 'markonm/traces.vim'

" 方式对齐
Plug 'godlygeek/tabular'    
let g:taabular_loaded = 1

" 彩虹括号 利用区分括号配对
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" }}}

call plug#end()

filetype plugin indent on
