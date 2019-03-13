" Vim自动把默认剪贴板和系统剪贴板的内容同步
set clipboard+=unnamed
packadd termdebug

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  小技巧                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 可以使用 ctrl-s 和ctrl-q 来映射快捷键
" silent !stty -ixon
" autocmd VimLeave * silent !stty ixon

" 在编辑模式中移动
inoremap <c-b> <left>
inoremap <c-f> <right>

" 在命令模式中用%%展开当前目录
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

nnoremap <C-H> :vert help<cr>

" 快速使用标签 参考unimparied
nnoremap ]g :tabnext<cr>
nnoremap [g :tabprevious<cr>
nnoremap [G :tabfirst<cr>
nnoremap ]G :tablast<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                插件自定义                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 缩进控制 ts{tabstop} sw{shiftwidth} sts{softtabstop} {{{
augroup filetype_indent
    autocmd!
    autocmd filetype c           setlocal ts=4 sw=4 sts=4
    autocmd filetype cpp         setlocal ts=4 sw=4 sts=4
    autocmd filetype css         setlocal ts=2 sw=2 sts=2
    autocmd filetype dockerfile  setlocal ts=4 sw=4 sts=4
    autocmd filetype graphql     setlocal ts=2 sw=2 sts=2
    autocmd filetype html        setlocal ts=2 sw=2 sts=2
    autocmd filetype java        setlocal ts=4 sw=4 sts=4
    autocmd filetype javascript  setlocal ts=2 sw=2 sts=2
    autocmd filetype json        setlocal ts=2 sw=2 sts=2
    autocmd filetype make        setlocal ts=4 sw=4 sts=4
    autocmd filetype python      setlocal ts=2 sw=2 sts=2
    autocmd filetype sh          setlocal ts=4 sw=4 sts=4
    autocmd filetype sql         setlocal ts=4 sw=4 sts=4
    autocmd filetype vim         setlocal ts=4 sw=4 sts=4
    autocmd filetype zsh         setlocal ts=4 sw=4 sts=4
augroup END
" }}}

" 使用标签来折叠vim配置文件
augroup filetype_vim
    autocmd!
    autocmd filetype vim setlocal foldmethod=marker
augroup END
