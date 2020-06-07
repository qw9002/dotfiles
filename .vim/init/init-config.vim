"======================================================================
"
" init-config.vim - 正常模式下的配置，在 init-basic.vim 后调用
"
"   - 设置通用前缀空格键
"   - Vim 自动把默认剪贴板和系统剪贴板的内容同步
"   - 功能插件开启
"   - 防止tmux下vim的背景色显示异常
"   - 配置微调
"   - 文件类型微调
"   - 终端设置，隐藏行号和侧边栏
"   - 备份设置
"
" vim: set ts=4 sw=4 tw=78 noet :
"======================================================================


"----------------------------------------------------------------------
" 设置通用前缀空格键
"----------------------------------------------------------------------
let mapleader="\<Space>"


"----------------------------------------------------------------------
" Vim 自动把默认剪贴板和系统剪贴板的内容同步
"----------------------------------------------------------------------
if has('clipboard')
    set clipboard^=unnamed,unnamedplus
elseif has('unix') && executable('xclip') && executable('xsel')
    vnoremap <silent><m-y> y:call
                \ system('echo -n ' . getreg('@0') . ' \| xclip -sel c')<cr>
endif


"----------------------------------------------------------------------
" 功能插件开启
"----------------------------------------------------------------------
packadd! termdebug
packadd! matchit
packadd! cfilter

" 调用man程序在vim内部查看命令
runtime ftplugin/man.vim

" 可视模式下用 * 号匹配字符串
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>


"----------------------------------------------------------------------
" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
"----------------------------------------------------------------------
if &term =~ '256color' && $TMUX != ''
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif


"----------------------------------------------------------------------
" 配置微调
"----------------------------------------------------------------------
" 修正 ScureCRT/XShell 以及某些终端乱码问题，主要原因是不支持一些
" 终端控制命令，比如 cursor shaping 这类更改光标形状的 xterm 终端命令
" 会令一些支持 xterm 不完全的终端解析错误，显示为错误的字符，比如 q 字符
" 如果你确认你的终端支持，不会在一些不兼容的终端上运行该配置，可以注释
if has('nvim')
    set guicursor=
elseif (!has('gui_running')) && has('terminal') && has('patch-8.0.1200')
    let g:termcap_guicursor = &guicursor
    let g:termcap_t_RS = &t_RS
    let g:termcap_t_SH = &t_SH
    set guicursor=
    set t_RS=
    set t_SH=
endif

" 打开文件时恢复上一次光标所在位置
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" 定义一个 DiffOrig 命令用于查看文件改动
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif


"----------------------------------------------------------------------
" 文件类型微调
"----------------------------------------------------------------------
augroup InitFileTypesGroup

    " 清除同组的历史 autocommand
    au!

    " C/C++ 文件使用 // 作为注释
    au FileType json,typescript,c,cpp setlocal commentstring=//\ %s

    " markdown 允许自动换行
    au FileType markdown setlocal wrap

    " expandtab 使用 tab 自动转化成空格展开
    " lisp 进行微调
    au FileType lisp setlocal ts=8 sts=2 sw=2 et

    " scala 微调
    au FileType scala setlocal sts=4 sw=4 noet

    " haskell 进行微调
    au FileType haskell setlocal et

    " quickfix 隐藏行号
    au FileType qf setlocal nonumber norelativenumber

    " 强制对某些扩展名的 filetype 进行纠正
    au BufNewFile,BufRead *.as setlocal filetype=actionscript
    au BufNewFile,BufRead *.pro setlocal filetype=prolog
    au BufNewFile,BufRead *.es setlocal filetype=erlang
    au BufNewFile,BufRead *.asc setlocal filetype=asciidoc
    au BufNewFile,BufRead *.vl setlocal filetype=verilog

augroup END

"----------------------------------------------------------------------
" 终端设置，隐藏行号和侧边栏
"----------------------------------------------------------------------
if has('terminal') && exists(':terminal') == 2
    if exists('##TerminalOpen')
        augroup VimUnixTerminalGroup
            au!
            au TerminalOpen * setlocal nonumber signcolumn=no
        augroup END
    endif
endif

"----------------------------------------------------------------------
" 备份设置
"----------------------------------------------------------------------
" 无需备份
set nobackup

" 禁用交换文件
set noswapfile

" 禁用 undo文件
set noundofile

