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

    au FileType c           setlocal ts=4 sw=4 sts=4
    au FileType cpp         setlocal ts=4 sw=4 sts=4
    au FileType css         setlocal ts=2 sw=2 sts=2
    au FileType dockerfile  setlocal ts=4 sw=4 sts=4
    au FileType graphql     setlocal ts=2 sw=2 sts=2
    au FileType html        setlocal ts=2 sw=2 sts=2
    au FileType java        setlocal ts=4 sw=4 sts=4
    au FileType javascript  setlocal ts=2 sw=2 sts=2 suffixesadd=.js
    au FileType typescript  setlocal ts=2 sw=2 sts=2 suffixesadd=.ts
    au FileType json        setlocal ts=2 sw=2 sts=2
    au FileType make        setlocal ts=4 sw=4 sts=4 noexpandtab
    au FileType python      setlocal ts=4 sw=4 sts=4
    au FileType sh          setlocal ts=4 sw=4 sts=4
    au FileType sql         setlocal ts=4 sw=4 sts=4
    au FileType vim         setlocal ts=4 sw=4 sts=4
    au FileType zsh         setlocal ts=4 sw=4 sts=4
augroup END
