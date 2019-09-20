"======================================================================
"
" init-tabsize.vim - 大部分人对 tabsize 都有自己的设置，改这里即可
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" 默认缩进模式（可以后期覆盖）
"----------------------------------------------------------------------

" 设置缩进宽度
set sw=4

" 设置 TAB 宽度
set ts=4

" 禁止展开 tab (noexpandtab)
set et

" 如果后面设置了 expandtab 那么展开 tab 为多少字符
set softtabstop=4


augroup FileTypeTab
    au!
    " 如果你需要 python 里用 tab，那么反注释下面这行字，否则vim会在打开py文件
    " 时自动设置成空格缩进。
    "au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab

    au filetype c           setlocal ts=4 sw=4 sts=4
    au filetype cpp         setlocal ts=4 sw=4 sts=4
    au filetype css         setlocal ts=2 sw=2 sts=2
    au filetype dockerfile  setlocal ts=4 sw=4 sts=4
    au filetype graphql     setlocal ts=2 sw=2 sts=2
    au filetype html        setlocal ts=2 sw=2 sts=2
    au filetype java        setlocal ts=4 sw=4 sts=4
    au filetype javascript  setlocal ts=2 sw=2 sts=2 suffixesadd=.js
    au filetype typescript  setlocal ts=2 sw=2 sts=2 suffixesadd=.ts
    au filetype json        setlocal ts=2 sw=2 sts=2
    au filetype make        setlocal ts=4 sw=4 sts=4 noexpandtab
    au filetype python      setlocal ts=4 sw=4 sts=4
    au filetype sh          setlocal ts=4 sw=4 sts=4
    au filetype sql         setlocal ts=4 sw=4 sts=4
    au filetype vim         setlocal ts=4 sw=4 sts=4
    au filetype zsh         setlocal ts=4 sw=4 sts=4
augroup END
