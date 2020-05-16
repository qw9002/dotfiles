packadd! cfilter
"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------

call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))

Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'

let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
let g:asynctasks_term_pos = 'tab'
let g:asyncrun_open = 10
let g:asynctasks_term_rows = 10    " 设置纵向切割时，高度为 10
let g:asynctasks_term_cols = 60    " 设置横向切割时，宽度为 60
let g:asynctasks_term_reuse = 1
let g:asynctasks_term_focus = 0

nnoremap <silent> <leader>ar :AsyncRun.
nnoremap <silent> <leader>as :AsyncStop<cr>
nnoremap <silent> <leader>am :AsyncTaskMacro<cr>
nnoremap <silent> <leader>ae :AsyncTaskEdit<cr>
nnoremap <silent> <leader>al :AsyncTaskList<cr>

nnoremap <silent> <leader>5 :AsyncTask file-run<cr>
nnoremap <silent> <leader>9 :AsyncTask file-build<cr>
nnoremap <silent> <leader>6 :AsyncTask project-run<cr>
nnoremap <silent> <leader>7 :AsyncTask project-build<cr>

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

" 多单词查询、代替、缩写
Plug 'tpope/vim-abolish'

" Git 支持
Plug 'tpope/vim-fugitive'

" 可视模式下用 * 号匹配字符串
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" 配对括号和引号自动补全
Plug 'jiangmiao/auto-pairs'

let g:AutoPairsFlyMode            = 0
let g:AutoPairsShortcutBackInsert = '<M-z>'
let g:AutoPairsShortcutToggle     = '<M-a>'
let g:AutoPairsMapCh              = 0
let g:AutoPairsMoveCharacter      = ''
let g:AutoPairsShortcutJump       = ''

" 基础插件：提供让用户方便的自定义文本对象的接口
Plug 'kana/vim-textobj-user'

" 增加文件文本对象: e   dae yae cie
Plug 'kana/vim-textobj-entire'

" 增加行文本对象: l   dal yal cil
Plug 'kana/vim-textobj-line'

" indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
Plug 'kana/vim-textobj-indent'

" 参数文本对象：i,/a, 包括参数或者列表元素
Plug 'sgur/vim-textobj-parameter'

"----------------------------------------------------------------------
" LeaderF：CtrlP / FZF 的超级代替者，文件模糊匹配，tags/函数名 选择
"----------------------------------------------------------------------
" 如果 vim 支持 python 则启用  Leaderf
if has('python') || has('python3')
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

    " CTRL+p 打开文件模糊匹配
    let g:Lf_ShortcutF = '<c-p>'

    " ALT+b 打开 buffer 模糊匹配
    let g:Lf_ShortcutB = '<m-b>'

    " CTRL+n 打开当前项目最近使用的文件 MRU，进行模糊匹配
    nnoremap <c-n> :LeaderfMruCwd<cr>

    " ALT+n 打开最近使用的文件 MRU，进行模糊匹配
    nnoremap <m-n> :LeaderfMru<cr>

    " ALT+f 打开函数列表，按 i 进入模糊匹配，ESC 退出
    nnoremap <m-f> :LeaderfFunction!<cr>

    " ALT+SHIFT+f 打开函数列表，按 i 进入模糊匹配，ESC 退出
    nnoremap <m-F> :LeaderfFunctionAll!<cr>

    " ALT+t 打开 tag 列表，i 进入模糊匹配，ESC退出
    nnoremap <m-t> :LeaderfBufTag!<cr>

    " 全局 tags 模糊匹配
    nnoremap <m-T> :LeaderfBufTagAll<cr>

    " Leaderf 自己的命令模糊匹配
    nnoremap <m-s> :LeaderfSelf<cr>

    " 最大历史文件保存 2048 个
    let g:Lf_MruMaxFiles = 2048

    " ui 定制
    let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

    " 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
    let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
    let g:Lf_WorkingDirectoryMode = 'Ac'
    let g:Lf_WindowHeight = 0.30
    let g:Lf_CacheDirectory = expand('~/.vim/cache')

    " 显示绝对路径
    let g:Lf_ShowRelativePath = 0

    " 隐藏帮助
    let g:Lf_HideHelp = 1

    " 模糊匹配忽略扩展名
    let g:Lf_WildIgnore = {
                \ 'dir': ['.svn','.git','.hg'],
                \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
                \ }

    " MRU 文件忽略扩展名
    let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
    let g:Lf_StlColorscheme = 'powerline'

    " 禁用 function/buftag 的预览功能，可以手动用 p 预览
    let g:Lf_PreviewResult = { 'Function':0, 'BufTag':0 }

    " 子命令 Leaderf[!] subCommand 下面中的一个参数, !直接进入普通模式
    " {
    "     bufTag: 当前缓冲区标签,
    "     buffer: 项目缓冲文件名,
    "     cmdHistory: 命令行历史,
    "     colorscheme: 色彩方案,
    "     command: 可用命令,
    "     file: 项目文件名,
    "     filetype: 项目文件类型指定,
    "     function: 当前缓冲区函数,
    "     gtags: gnu global符号索引,
    "     help: 帮助标签,
    "     line: 搜索行在缓冲区中,
    "     mru: 最近使用的文件,
    "     rg: ripgrep 文本搜索,
    "     searchHistory: 搜索命令行历史,
    "     self: Leaderf自己的命令,
    "     tag: 当前项目所有标签,
    " }
    " 使用 ESC 键可以直接退出 leaderf 的 normal 模式
    let g:Lf_NormalMap = {
                \ 'BufTag': [['<ESC>', ':exec g:Lf_py "bufTagExplManager.quit()"<cr>']],
                \ 'Buffer': [['<ESC>', ':exec g:Lf_py "bufExplManager.quit()"<cr>']],
                \ 'File':   [['<ESC>', ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
                \ 'Function': [['<ESC>', ':exec g:Lf_py "functionExplManager.quit()"<cr>']],
                \ 'Mru': [['<ESC>', ':exec g:Lf_py "mruExplManager.quit()"<cr>']],
                \ 'Rg': [['<ESC>', ':exec g:Lf_py "rgExplManager.quit()"<cr>']],
                \ 'Self': [['<ESC>', ':exec g:Lf_py "selfExplManager.quit()"<cr>']],
                \ 'Tag': [['<ESC>', ':exec g:Lf_py "tagExplManager.quit()"<cr>']],
                \ }

    " 开启后不能在普通模式中使用搜索/
    let g:Lf_WindowPosition = 'popup'
    let g:Lf_PreviewInPopup = 1 " 就可以启用这个功能，缺省未启用。
    let g:Lf_PreviewHorizontalPosition = 'center' " 指定 popup window / floating window 的位置。
    let g:Lf_PreviewPopupWidth = 100 " 指定 popup window / floating window 的宽度。

    if executable('rg')
        xnoremap gs :<C-U><C-R>=printf("Leaderf! rg -F -e %s", leaderf#Rg#visual())<CR><CR>
        nnoremap gs :<C-U><C-R>=printf("Leaderf! rg -e %s", expand("<cword>"))<CR>
    endif
    noremap <leader>cr :<C-U>Leaderf! --recall<CR>
endif

" 显示 quickfix 列表和 location 列表
Plug 'Valloric/ListToggle'
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10

if has('python3')
    Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --clangd-completer --ts-completer' }
elseif has('python')
    Plug 'ycm-core/YouCompleteMe', {
                \ 'branch': 'legacy-py2',
                \ 'do': 'python install.py --clang-completer --ts-completer'
                \ }
endif

let g:ycm_max_diagnostics_to_display = 0

" 触发快捷键设置
let g:ycm_key_list_select_completion   = ['<c-n>']
let g:ycm_key_list_previous_completion = ['<c-p>']
let g:ycm_key_list_stop_completion = ['<c-y>']
let g:ycm_key_invoke_completion = '<c-z>'
" 当用户的光标位于诊断行上时用于显示完整诊断文本。默认 <leader>d
let g:ycm_key_detailed_diagnostics = '<leader>d'
set completeopt+=preview

let g:ycm_server_log_level = 'info'
" 禁用诊断功能：我们用前面更好用的 ALE 代替
let g:ycm_show_diagnostics_ui = 1
" 禁用预览功能：扰乱视听
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" 不显示load python 提示
let g:ycm_confirm_extra_conf=0
" 通过ycm语法检测显示错误符号和警告符号
let g:ycm_error_symbol   = '✗'
let g:ycm_warning_symbol = '⚠'
let g:ycm_always_populate_location_list = 1


" 输入最少字符开启字符补全功能 默认 2
" let g:ycm_min_num_of_chars_for_completion = 2
" 显示字符候选标识符最少的字符数 默认 0
let g:ycm_min_num_identifier_candidate_chars = 4
" 最大语义补全符数量 默认 50
" let g:ycm_max_num_candidates = 50
" 最大标识符数量 默认 10
let g:ycm_max_num_identifier_candidates = 3
" 设置为 0 时，不再触发语义补全
" let g:ycm_auto_trigger = 1
" c 语言中的 #include 会自动补全文件
let g:ycm_complete_in_strings=1
" 设置为 1 时，补全标识符信息会从注释中获取 默认为 0
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 当此选项设置为1时，YCM的标识符完成器还将从标记文件中收集标识符
" let g:ycm_collect_identifiers_from_tags_files = 1

" 两个字符自动触发语义补全
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua': ['re!\w{2}'],
            \ 'javascript,typescript': ['re!([A-Z]\w|\w[A-Z]|\w{2}[A-Z]|\w{4})'],
            \ }

"----------------------------------------------------------------------
" Ycm 白名单（非名单内文件不启用 YCM），避免打开个 1MB 的 txt 分析半天
"----------------------------------------------------------------------
let g:ycm_filetype_whitelist = {
            \ 'asciidoc':1,
            \ 'asm':1,
            \ 'asm68k':1,
            \ 'asmh8300':1,
            \ 'bash':1,
            \ 'basic':1,
            \ 'c':1,
            \ 'cmake':1,
            \ 'coffee':1,
            \ 'conf':1,
            \ 'config':1,
            \ 'cpp':1,
            \ 'cs':1,
            \ 'cson':1,
            \ 'css':1,
            \ 'dosini':1,
            \ 'erlang':1,
            \ 'go':1,
            \ 'haskell':1,
            \ 'html':1,
            \ 'java':1,
            \ 'javascript':1,
            \ 'json':1,
            \ 'less':1,
            \ 'lhaskell':1,
            \ 'lisp':1,
            \ 'lua':1,
            \ 'make':1,
            \ 'man':1,
            \ 'markdown':1,
            \ 'masm':1,
            \ 'matlab':1,
            \ 'maxima':1,
            \ 'nasm':1,
            \ 'objc':1,
            \ 'objcpp':1,
            \ 'perl':1,
            \ 'perl6':1,
            \ 'php':1,
            \ 'ps1':1,
            \ 'python':1,
            \ 'ruby':1,
            \ 'rust':1,
            \ 'scheme':1,
            \ 'sdl':1,
            \ 'sh':1,
            \ 'tasm':1,
            \ 'typescript':1,
            \ 'vb':1,
            \ 'vim':1,
            \ 'zimbu':1,
            \ 'zsh':1,
            \ }

autocmd FileType c,cpp,objc,objcpp,cuda,cs,go,java,javascript,python,rust,typescript
            \ nnoremap gd :YcmCompleter GoTo<CR>

" 重构后的结果会加入到 quickfix 中，方便查看修改
autocmd FileType c,cpp,objc,objcpp,cuda,java,javascript,typescript,rust,cs
            \ nnoremap gcr :YcmCompleter RefactorRename 

autocmd FileType c,cpp,objc,objcpp,cuda,cs,go,java,javascript,rust,typescript
            \ nnoremap gcs :YcmCompleter RestartServer<CR>

autocmd FileType c,cpp,objc,objcpp,cuda,java,javascript,go,typescript,rust,cs
            \ noremap gcf :YcmCompleter Format<CR>

autocmd FileType c,cpp,objc,objcpp,cuda,java,javascript,go,python,typescript,rust
            \ nnoremap gct :YcmCompleter GetType<CR>

autocmd FileType c,cpp,objc,objcpp,cuda,cs,go,java,javascript,python,typescript,rust
            \ nnoremap gcd :YcmCompleter GetDoc<CR>

autocmd FileType java,javascript,typescript
            \ nnoremap gco :YcmCompleter OrganizeImports<CR>

autocmd FileType c,cpp,objc,objcpp,cuda,cs,go,java,javascript,rust,typescript
            \ nnoremap gcx :YcmCompleter FixIt<cr>

" snippets 片段扩展
" 通过 VimL 语言的支持 " 需要通过 Python 的支持
if has('python')
    Plug 'SirVer/ultisnips', { 'commit': '7dc30c5' }
elseif has('python3')
    Plug 'SirVer/ultisnips'
endif
Plug 'honza/vim-snippets'

let g:UltiSnipsSnippetDirectories  = [ 'UltiSnips', 'mysnippets' ]
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsListSnippets        = '<c-l>'
let g:UltiSnipsEditSplit           = 'vertical'


"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()

" Provides tab-completion for all file-related tasks
set path+=**

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
