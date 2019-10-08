"======================================================================
"
" init-plugins.vim -
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

" 调用man程序在vim内部查看命令
runtime ftplugin/man.vim

"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
    let g:bundle_group  = ['basic', 'tags', 'enhanced', 'filetypes', 'textobj']
    let g:bundle_group += ['tags', 'airline', 'nerdtree', 'ale', 'echodoc']
    let g:bundle_group += ['leaderf', 'ycm']
    let g:bundle_group += ['tool']
endif


"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
    let path = expand(s:home . '/' . a:path )
    return substitute(path, '\\', '/', 'g')
endfunc


"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))

"----------------------------------------------------------------------
" 默认插件
"----------------------------------------------------------------------

" 全文快速移动,按需使用移动命令
Plug 'easymotion/vim-easymotion', { 'on': ['<plug>(easymotion-f)', '<plug>(easymotion-F)', '<plug>(easymotion-j)', '<plug>(easymotion-k)'] }
map <leader>f <plug>(easymotion-f)
map <leader>F <plug>(easymotion-F)
map <leader>j <plug>(easymotion-j)
map <leader>k <plug>(easymotion-k)
" 忽略大小写
let g:EasyMotion_smartcase = 1

" 对齐
Plug 'junegunn/vim-easy-align'
vmap <Enter> <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
            \ '>': { 'pattern': '>>\|=>\|>' },
            \ '/': {
            \     'pattern':         '//\+\|/\*\|\*/',
            \     'delimiter_align': 'l',
            \     'ignore_groups':   ['!Comment'] },
            \ ']': {
            \     'pattern':       '[[\]]',
            \     'left_margin':   0,
            \     'right_margin':  0,
            \     'stick_to_left': 0
            \   },
            \ ')': {
            \     'pattern':       '[()]',
            \     'left_margin':   0,
            \     'right_margin':  0,
            \     'stick_to_left': 0
            \   },
            \ 'd': {
            \     'pattern':      ' \(\S\+\s*[;=]\)\@=',
            \     'left_margin':  0,
            \     'right_margin': 0
            \   }
            \ }

" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'chrisbra/vim-diff-enhanced'

Plug 'skywind3000/asyncrun.vim'

"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0

    " 展示开始画面，显示最近编辑过的文件
    Plug 'mhinz/vim-startify'

    " 一次性安装一大堆 colorscheme
    Plug 'flazz/vim-colorschemes'

    " 支持库，给其他插件用的函数库
    Plug 'xolox/vim-misc'

    " 用于在侧边符号栏显示 git/svn 的 diff
    Plug 'mhinz/vim-signify'

    " 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
    " 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
    Plug 'mh21/errormarker.vim'

    " 使用 <space>ha 清除 errormarker 标注的错误
    noremap <silent> <space>ha :RemoveErrorMarkers<cr>

    " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
    Plug 'skywind3000/vim-preview'

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

    " 交换两个或更多的单词
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

    " 查寻高亮在首个匹配上
    nnoremap <silent> * :keepjumps normal! mi*`i<CR>

    " 可视模式下用 * 号匹配字符串
    Plug 'nelstrom/vim-visual-star-search'

    " 筛选符合条件的 argslist 文件并保存到 args 中去, 使用 argdo 处理匹配文件
    Plug 'nelstrom/vim-qargs'

    " 默认不显示 startify
    let g:startify_disable_at_vimenter    = 1
    let g:startify_session_dir            = '~/.vim/session'
    let g:startify_session_persistence    = 1
    let g:startify_session_delete_buffers = 1
    let g:startify_session_autoload       = 0
    let g:startify_change_to_dir          = 1
    let g:startify_bookmarks              = [
                \{'c': '~/.vimrc'},
                \'~/.zshrc',
                \{'p': '~/docs/plant.md'}
                \]

    nmap <leader>p :Startify<cr>

    " signify 调优
    let g:signify_vcs_list               = ['git', 'svn']
    let g:signify_sign_add               = '+'
    let g:signify_sign_delete            = '_'
    let g:signify_sign_delete_first_line = '‾'
    let g:signify_sign_change            = '~'
    let g:signify_sign_changedelete      = g:signify_sign_change

    " git 仓库使用 histogram 算法进行 diff
    let g:signify_vcs_cmds = {
                \ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
                \}

    noremap <c-w>p :PreviewTag<cr>
    noremap <m-u> :PreviewScroll -1<cr>
    noremap <m-d> :PreviewScroll +1<cr>
    inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
    inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>
    autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
endif


"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhanced') >= 0

    " 给不同语言提供字典补全，插入模式下 c-x c-k 触发
    Plug 'asins/vim-dict'

    " 配对括号和引号自动补全
    Plug 'jiangmiao/auto-pairs', { 'for': [ 'c', 'cpp', 'java', 'python', 'javascript', 'typescript', 'vim' ] }
    let g:AutoPairsFlyMode            = 0
    let g:AutoPairsShortcutBackInsert = '<M-z>'
    let g:AutoPairsShortcutToggle     = '<M-a>'
    let g:AutoPairsMapCh              = 0
    let g:AutoPairsMoveCharacter      = '<Nop>'
    let g:AutoPairsShortcutJump       = ''

    " 提供 gist 接口
    Plug 'lambdalisue/vim-gista', { 'on': 'Gista' }
endif


"----------------------------------------------------------------------
" 自动生成 ctags/gtags，并提供自动索引功能
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
" 详细用法见：https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------
if index(g:bundle_group, 'tags') >= 0

    " 提供 ctags/gtags 后台数据库自动更新功能
    Plug 'ludovicchabant/vim-gutentags'

    " 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
    " 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
    Plug 'skywind3000/gutentags_plus'

    " 第一个 GTAGSLABEL 告诉 gtags 默认 C/C++/Java 等六种原生支持的代码直接使用
    " gtags 本地分析器，而其他语言使用 pygments 模块。
    let $GTAGSLABEL = 'native-pygments'
    let $GTAGSCONF = expand('~/.gtags.conf')

    " 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
    let g:gutentags_project_root = [ '.root', '.svn', '.git', '.hg', '.project' ]

    " 去除生成标签的文件夹
    let g:gutentags_ctags_exclude = [ '*.min.js', '*.min.css', 'build', 'vendor', '.git', '.tmux', 'bundles' ]

    " 所生成的数据文件的名称
    let g:gutentags_ctags_tagfile = '.tags'

    " 默认生成的数据文件集中到 ~/.cache/tags 避免污染项目目录，好清理
    let g:gutentags_cache_dir = expand('~/.cache/tags')

    " 默认禁用自动生成
    let g:gutentags_modules = [] 

    " 如果有 ctags 可执行就允许动态生成 ctags 文件
    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif

    " 如果有 gtags 可执行就允许动态生成 gtags 数据库
    if executable('gtags') && executable('gtags-cscope')
        let g:gutentags_modules += ['gtags_cscope']
    endif

    let g:gutentags_plus_switch = 1

    " 设置 ctags 的参数
    let g:gutentags_ctags_extra_args  = ['--fields=+niazS', '--extras=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    " 使用 universal-ctags 的话需要下面这行，请反注释
    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

    " 禁止 gutentags 自动链接 gtags 数据库
    let g:gutentags_auto_add_gtags_cscope = 0

    " let g:gutentags_trace = 1
    " let g:gutentags_define_advanced_commands = 1
endif


"----------------------------------------------------------------------
" 文本对象：textobj 全家桶
"----------------------------------------------------------------------
if index(g:bundle_group, 'textobj') >= 0

    " 基础插件：提供让用户方便的自定义文本对象的接口
    Plug 'kana/vim-textobj-user'

    " 增加文件文本对象: e   dae yae cie
    Plug 'kana/vim-textobj-entire'

    " 增加行文本对象: l   dal yal cil
    Plug 'kana/vim-textobj-line'

    " indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
    Plug 'kana/vim-textobj-indent'

    " 语法文本对象：iy/ay 基于语法的文本对象
    Plug 'kana/vim-textobj-syntax'

    " 函数文本对象：if/af 支持 c/c++/vim/java
    Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }

    " 参数文本对象：i,/a, 包括参数或者列表元素
    Plug 'sgur/vim-textobj-parameter'

    " 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
    Plug 'bps/vim-textobj-python', {'for': 'python'}

    " 提供 uri/url 的文本对象，iu/au 表示
    Plug 'jceb/vim-textobj-uri'

    " 正则匹配单词的一部分，提供操作可以用operate + (? or i)/（正则模式类型）
    Plug 'kana/vim-textobj-lastpat'
endif


"----------------------------------------------------------------------
" 文件类型扩展
"----------------------------------------------------------------------
if index(g:bundle_group, 'filetypes') >= 0

    " " powershell 脚本文件的语法高亮
    " Plug 'pprovost/vim-ps1', { 'for': 'ps1' }

    " " lua 语法高亮增强
    " Plug 'tbastos/vim-lua', { 'for': 'lua' }

    " C++ 语法高亮增强，支持 11/14/17 标准
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

    " 额外语法文件
    Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

    " python 语法文件增强
    Plug 'vim-python/python-syntax', { 'for': ['python'] }

    " " rust 语法增强
    " Plug 'rust-lang/rust.vim', { 'for': 'rust' }
endif


"----------------------------------------------------------------------
" airline
"----------------------------------------------------------------------
if index(g:bundle_group, 'airline') >= 0
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_left_sep                        = ''
    let g:airline_left_alt_sep                    = ''
    let g:airline_right_sep                       = ''
    let g:airline_right_alt_sep                   = ''
    let g:airline_powerline_fonts                 = 1
    let g:airline_exclude_preview                 = 1
    let g:airline_section_b                       = '%n'
    let g:airline_theme                           = 'deus'
    let g:airline#extensions#branch#enabled       = 0
    let g:airline#extensions#syntastic#enabled    = 0
    let g:airline#extensions#fugitiveline#enabled = 0
    let g:airline#extensions#csv#enabled          = 0
    let g:airline#extensions#vimagit#enabled      = 0
endif


"----------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------
if index(g:bundle_group, 'nerdtree') >= 0
    Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeDirArrows = 1
    let g:NERDTreeHijackNetrw = 0
    noremap <space>nn :NERDTree<cr>
    noremap <space>no :NERDTreeFocus<cr>
    noremap <space>nm :NERDTreeMirror<cr>
    noremap <space>nt :NERDTreeToggle<cr>
endif


"----------------------------------------------------------------------
" LanguageTool 语法检查
"----------------------------------------------------------------------
if index(g:bundle_group, 'grammer') >= 0
    Plug 'rhysd/vim-grammarous'
    noremap <space>rg :GrammarousCheck --lang=en-US --no-move-to-first-error --no-preview<cr>
    map <space>rr <Plug>(grammarous-open-info-window)
    map <space>rv <Plug>(grammarous-move-to-info-window)
    map <space>rs <Plug>(grammarous-reset)
    map <space>rx <Plug>(grammarous-close-info-window)
    map <space>rm <Plug>(grammarous-remove-error)
    map <space>rd <Plug>(grammarous-disable-rule)
    map <space>rn <Plug>(grammarous-move-to-next-error)
    map <space>rp <Plug>(grammarous-move-to-previous-error)
endif


"----------------------------------------------------------------------
" ale：动态语法检查
"----------------------------------------------------------------------
if index(g:bundle_group, 'ale') >= 0
    Plug 'w0rp/ale'

    " 设定延迟和提示信息
    let g:ale_completion_delay = 500
    let g:ale_echo_delay       = 20
    let g:ale_lint_delay       = 500
    let g:ale_echo_msg_format  = '[%linter%] %code: %%s'

    " 设定检测的时机：normal 模式文字改变，或者离开 insert模式
    " 禁用默认 INSERT 模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_insert_leave = 1

    " 在 linux/mac 下降低语法检查程序的进程优先级（不要卡到前台进程）
    if has('win32') == 0 && has('win64') == 0 && has('win32unix') == 0
        let g:ale_command_wrapper = 'nice -n5'
    endif

    " 允许 airline 集成
    let g:airline#extensions#ale#enabled = 1

    " 编辑不同文件类型需要的语法检查器
    let g:ale_linters = {
                \ 'c': ['clang'],
                \ 'cpp': ['clang'],
                \ 'python': ['flake8', 'pylint'],
                \ 'lua': ['luac'],
                \ 'go': ['go build', 'gofmt'],
                \ 'java': ['javac'],
                \ 'javascript': ['eslint'],
                \ 'typescript': ['tslint'],
                \ }


    " 获取 pylint, flake8 的配置文件，在 vim-init/tools/conf 下面
    function s:lintcfg(name)
        let conf  = s:path('tools/conf/')
        let path1 = conf . a:name
        let path2 = expand('~/.vim/linter/'. a:name)
        if filereadable(path2)
            return path2
        endif
        return shellescape(filereadable(path2)? path2 : path1)
    endfunc

    " 设置 flake8/pylint 的参数
    let g:ale_python_flake8_options  = '--conf='.s:lintcfg('flake8.conf')
    let g:ale_python_pylint_options  = '--rcfile='.s:lintcfg('pylint.conf')
    let g:ale_python_pylint_options .= ' --disable=W'
    let g:ale_c_gcc_options          = '-Wall -O2 -std=c99'
    let g:ale_cpp_gcc_options        = '-Wall -O2 -std=c++14'
    let g:ale_c_cppcheck_options     = ''
    let g:ale_cpp_cppcheck_options   = ''

    let g:ale_linters.text = ['textlint', 'write-good', 'languagetool']

    " 如果没有 gcc 只有 clang 时（FreeBSD）
    if executable('clang') == 0 && executable('gcc')
        let g:ale_linters.c   += ['gcc', 'cppcheck']
        let g:ale_linters.cpp += ['gcc', 'cppcheck']
    endif

    " 错误提示符及警告提示符
    let g:ale_sign_error   = '✗'
    let g:ale_sign_warning = '⚠'
endif


"----------------------------------------------------------------------
" echodoc：搭配 YCM/deoplete 在底部显示函数参数
"----------------------------------------------------------------------
if index(g:bundle_group, 'echodoc') >= 0
    Plug 'Shougo/echodoc.vim'
    set noshowmode
    let g:echodoc#enable_at_startup = 1
endif


"----------------------------------------------------------------------
" LeaderF：CtrlP / FZF 的超级代替者，文件模糊匹配，tags/函数名 选择
"----------------------------------------------------------------------
if index(g:bundle_group, 'leaderf') >= 0
    " 如果 vim 支持 python 则启用  Leaderf
    if has('python') || has('python3')
        Plug 'Yggdroot/LeaderF'

        " CTRL+p 打开文件模糊匹配
        let g:Lf_ShortcutF = '<c-p>'

        " ALT+n 打开 buffer 模糊匹配
        let g:Lf_ShortcutB = '<m-n>'

        " CTRL+n 打开最近使用的文件 MRU，进行模糊匹配
        noremap <c-n> :LeaderfMru<cr>

        " ALT+p 打开函数列表，按 i 进入模糊匹配，ESC 退出
        noremap <m-p> :LeaderfFunction!<cr>

        " ALT+SHIFT+p 打开 tag 列表，i 进入模糊匹配，ESC退出
        noremap <m-P> :LeaderfBufTag!<cr>

        " ALT+n 打开 buffer 列表进行模糊匹配
        noremap <m-n> :LeaderfBuffer<cr>

        " 全局 tags 模糊匹配
        noremap <m-m> :LeaderfTag<cr>

        " 最大历史文件保存 2048 个
        let g:Lf_MruMaxFiles = 2048

        " ui 定制
        let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

        " 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
        let g:Lf_RootMarkers          = ['.project', '.root', '.svn', '.git']
        let g:Lf_WorkingDirectoryMode = 'Ac'
        let g:Lf_WindowHeight         = 0.30
        let g:Lf_CacheDirectory       = expand('~/.vim/cache')

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
        let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

        " 使用 ESC 键可以直接退出 leaderf 的 normal 模式
        let g:Lf_NormalMap = {
                    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
                    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<cr>']],
                    \ "Mru": [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<cr>']],
                    \ "Tag": [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<cr>']],
                    \ "BufTag": [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<cr>']],
                    \ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<cr>']],
                    \ }

    else
        " 不支持 python ，使用 CtrlP 代替
        Plug 'ctrlpvim/ctrlp.vim'

        " 显示函数列表的扩展插件
        Plug 'tacahiroy/ctrlp-funky'

        " 忽略默认键位
        let g:ctrlp_map = ''

        " 模糊匹配忽略
        let g:ctrlp_custom_ignore = {
                    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
                    \ 'file': '\v\.(exe|so|dll|mp3|wav|sdf|suo|mht)$',
                    \ 'link': 'some_bad_symbolic_links',
                    \ }

        " 项目标志
        let g:ctrlp_root_markers = ['.project', '.root', '.svn', '.git']
        let g:ctrlp_working_path = 0

        " CTRL+p 打开文件模糊匹配
        noremap <c-p> :CtrlP<cr>

        " CTRL+n 打开最近访问过的文件的匹配
        noremap <c-n> :CtrlPMRUFiles<cr>

        " ALT+p 显示当前文件的函数列表
        noremap <m-p> :CtrlPFunky<cr>

        " ALT+n 匹配 buffer
        noremap <m-n> :CtrlPBuffer<cr>
    endif
endif

if index(g:bundle_group, 'ycm') >= 0
    " 显示 quickfix 列表和 location 列表
    Plug 'Valloric/ListToggle'
    let g:lt_location_list_toggle_map = '<leader>l'
    let g:lt_quickfix_list_toggle_map = '<leader>q'
    let g:lt_height = 10

    if has('python3')
        Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --clang-completer --ts-completer' }
    elseif has('python')
        Plug 'ycm-core/YouCompleteMe', { 'do': 'python install.py --clang-completer --ts-completer' }
    endif

    if has('python3') || has('python')
        " 触发快捷键设置
        let g:ycm_key_list_select_completion   = ['<C-n>']
        let g:ycm_key_list_previous_completion = ['<C-p>']
        let g:SuperTabDefaultCompletionType    = '<C-n>'
        " 不显示load python 提示
        let g:ycm_confirm_extra_conf=0
        " 通过ycm语法检测显示错误符号和警告符号
        let g:ycm_error_symbol   = '✗'
        let g:ycm_warning_symbol = '⚠'
        let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

        " 禁用预览功能：扰乱视听
        let g:ycm_add_preview_to_completeopt = 0

        " 禁用诊断功能：我们用前面更好用的 ALE 代替
        let g:ycm_show_diagnostics_ui = 0
        let g:ycm_server_log_level = 'info'
        let g:ycm_min_num_identifier_candidate_chars = 2
        let g:ycm_collect_identifiers_from_comments_and_strings = 1
        let g:ycm_complete_in_strings=1
        let g:ycm_key_invoke_completion = '<c-z>'
        set completeopt=menu,menuone,noselect

        " 默认展示代码片段
        " let g:ycm_use_ultisnips_completer = 1
        nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

        " noremap <c-z> <NOP>

        " 两个字符自动触发语义补全
        let g:ycm_semantic_triggers =  {
                    \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                    \ 'cs,lua,javascript,typescript': ['re!\w{2}'],
                    \ }


        "----------------------------------------------------------------------
        " Ycm 白名单（非名单内文件不启用 YCM），避免打开个 1MB 的 txt 分析半天
        "----------------------------------------------------------------------
        let g:ycm_filetype_whitelist = { 
                    \ "c":1,
                    \ "cpp":1, 
                    \ "objc":1,
                    \ "objcpp":1,
                    \ "python":1,
                    \ "java":1,
                    \ "javascript":1,
                    \ "typescript":1,
                    \ "coffee":1,
                    \ "vim":1, 
                    \ "go":1,
                    \ "cs":1,
                    \ "lua":1,
                    \ "perl":1,
                    \ "perl6":1,
                    \ "php":1,
                    \ "ruby":1,
                    \ "rust":1,
                    \ "erlang":1,
                    \ "asm":1,
                    \ "nasm":1,
                    \ "masm":1,
                    \ "tasm":1,
                    \ "asm68k":1,
                    \ "asmh8300":1,
                    \ "asciidoc":1,
                    \ "basic":1,
                    \ "vb":1,
                    \ "make":1,
                    \ "cmake":1,
                    \ "html":1,
                    \ "css":1,
                    \ "less":1,
                    \ "json":1,
                    \ "cson":1,
                    \ "typedscript":1,
                    \ "haskell":1,
                    \ "lhaskell":1,
                    \ "lisp":1,
                    \ "scheme":1,
                    \ "sdl":1,
                    \ "sh":1,
                    \ "zsh":1,
                    \ "bash":1,
                    \ "man":1,
                    \ "markdown":1,
                    \ "matlab":1,
                    \ "maxima":1,
                    \ "dosini":1,
                    \ "conf":1,
                    \ "config":1,
                    \ "zimbu":1,
                    \ "ps1":1,
                    \ }
    endif
endif

if index(g:bundle_group, 'tool') >= 0
    " 预览命令行命令效果
    Plug 'markonm/traces.vim'

    " 彩虹括号 利用区分括号配对
    Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1

    " snippets 片段扩展
    " 通过 VimL 语言的支持
    Plug 'honza/vim-snippets'
    " 需要通过 Python 的支持
    Plug 'SirVer/ultisnips'
    let g:UltiSnipsSnippetDirectories  = ["UltiSnips", "mysnippets"]
    let g:UltiSnipsExpandTrigger       = "<tab>"
    let g:UltiSnipsJumpForwardTrigger  = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

    " emmet高速编写网页类代码 {{{
    Plug 'mattn/emmet-vim', { 'for': [ 'html' ] }
    let g:emmet_html5 = 1

    " 帮助emmet显示snippets提示
    Plug 'jceb/emmet.snippets'

    Plug 'sillybun/vim-repl'
    let g:repl_program = {
                \   'python': 'python',
                \   'javascript': 'node',
                \   'typescript': 'ts-node',
                \   'r': 'R',
                \   'lua': 'lua',
                \   'default': 'zsh',
                \   }

    let g:repl_exit_commands = {
                \   'python': 'quit()',
                \   'bash': 'exit',
                \   'zsh': 'exit',
                \   'node': '.exit',
                \   "ts-node": '.exit',
                \   'jshell': '/exit',
                \   'default': 'exit',
                \   }

    let g:repl_predefine_python = {
                \   'numpy': 'import numpy as np',
                \   'matplotlib': 'from matplotlib import pyplot as plt'
                \   }
    let g:repl_cursor_down = 1
    let g:repl_python_automerge = 1
    let g:repl_ipython_version = '7'
    nnoremap <leader>r :REPLToggle<Cr>
    " autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
    " autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
    " autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
    let g:repl_position = 3
    let g:repl_stayatrepl_when_open = 0

    Plug 'mzlogin/vim-markdown-toc', { 'for': [ 'markdown' ] }
    Plug 'godlygeek/tabular', { 'for': [ 'markdown' ] }
    Plug 'plasticboy/vim-markdown', { 'for': [ 'markdown' ] }
endif

"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()
