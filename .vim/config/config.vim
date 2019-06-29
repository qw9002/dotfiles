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

" 添加文件到缓冲中时不加入下列类型文件
set wildignore=*.swp,*.bak " 临时文件
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*,*.o " 编译文件
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/* " 版本控制文件
set wildignore+=tags " 标签文件
set wildignore+=*.tar.* " 压缩文件


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                插件自定义                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ycm {{{
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
" let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

map gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 触发语义补全
let g:ycm_semantic_triggers = {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript,typescript': ['re!\w{2}'],
            \ }

" 避免编辑白名单外的文件类型时 YCM也在那分析半天，
" 比如你打开个 1MB 的 TXT 文件，YCM还要在那里空跑半天就傻了
" 语义补全白名单
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "python":1,
            \ "java":1,
            \ "javascript.jsx":1,
            \ "javascript":1,
            \ "typescript":1,
            \ "sh":1,
            \ "zsh":1,
            \ "zimbu":1,
            \ }
" }}}

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
    autocmd filetype typescript  setlocal ts=2 sw=2 sts=2
    autocmd filetype json        setlocal ts=2 sw=2 sts=2
    autocmd filetype make        setlocal ts=4 sw=4 sts=4
    autocmd filetype python      setlocal ts=2 sw=2 sts=2
    autocmd filetype sh          setlocal ts=4 sw=4 sts=4
    autocmd filetype sql         setlocal ts=4 sw=4 sts=4
    autocmd filetype vim         setlocal ts=4 sw=4 sts=4
    autocmd filetype zsh         setlocal ts=4 sw=4 sts=4
augroup END
" }}}

" {{{ 跳转到对应语言项目中
augroup file_jump
  autocmd!

  autocmd BufLeave *.c    normal! mC
  autocmd BufLeave *.html normal! mH
  autocmd BufLeave *.js   normal! mJ
  autocmd BufLeave *.ts   normal! mT
augroup END
" }}}

set background=dark
colorscheme dracula

" 使用标签来折叠vim配置文件
augroup filetype_vim
    autocmd!
    autocmd filetype vim setlocal foldmethod=marker
augroup END
