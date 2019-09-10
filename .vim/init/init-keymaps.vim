"======================================================================
"
" init-keymaps.vim - 按键设置，按你喜欢更改
"
"   - 快速移动
"   - 标签切换
"   - 窗口切换
"   - 终端支持
"   - 编译运行
"   - 符号搜索
"
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" NORMAL 模式
"----------------------------------------------------------------------

" ALT+h/l 快速左右按单词移动
" ALT+j/k 逻辑跳转下一行/上一行（按 wrap 逻辑换行进行跳转）
noremap <m-h> b
noremap <m-l> w
noremap <m-j> gj
noremap <m-k> gk


"----------------------------------------------------------------------
" INSERT 模式下使用 EMACS 键位
"----------------------------------------------------------------------

inoremap <c-f> <right>
inoremap <c-b> <left>
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <m-f> <c-right>
inoremap <m-b> <c-left>

" vim原组合键 使用 <c-_> 代替
inoremap <c-_> <c-k>


"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标（INSERT 模式偶尔需要移动的方便些）
" 使用 SecureCRT/XShell 等终端软件需设置：Backspace sends delete
" 详见：http://www.skywind.me/blog/archives/2021
"----------------------------------------------------------------------

inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

" ALT 键移动增强
inoremap <m-j> <c-\><c-o>gj
inoremap <m-k> <c-\><c-o>gk
inoremap <m-h> <c-left>
inoremap <m-l> <c-right>


"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------

cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <m-f> <c-right>
cnoremap <m-b> <c-left>

" ALT 键移动增强
cnoremap <m-h> <c-left>
cnoremap <m-l> <c-right>

" ALT+y 删除到行末
noremap <m-y> d$
inoremap <m-y> <c-\><c-o>d$
cnoremap <m-y> <c-\><c-o>d$


"----------------------------------------------------------------------
" TAB：创建，关闭，上一个，下一个，首个，末个，左移，右移，
"----------------------------------------------------------------------

" 快速切换tab 使用标签 参考unimparied
nnoremap ]g :tabnext<cr>
nnoremap [g :tabprevious<cr>
nnoremap [G :tabfirst<cr>
nnoremap ]G :tablast<cr>

" 左移 tab
function! Tab_MoveLeft()
    let l:tabnr = tabpagenr() - 2
    if l:tabnr >= 0
        exec 'tabmove '.l:tabnr
    endif
endfunc

" 右移 tab
function! Tab_MoveRight()
    let l:tabnr = tabpagenr() + 1
    if l:tabnr <= tabpagenr('$')
        exec 'tabmove '.l:tabnr
    endif
endfunc

noremap <silent> <c-w>tn :tabnew<cr>
noremap <silent> <c-w>tc :tabclose<cr>
noremap <silent> <c-w>to :tabonly<cr>
noremap <silent> <c-w>th :call Tab_MoveLeft()<cr>
noremap <silent> <c-w>tl :call Tab_MoveRight()<cr>

"----------------------------------------------------------------------
" 窗口切换：ALT+SHIFT+hjkl
" 传统的 CTRL+hjkl 移动窗口不适用于 vim 8.1 的终端模式，CTRL+hjkl 在
" bash/zsh 及带文本界面的程序中都是重要键位需要保留，不能 tnoremap 的
"----------------------------------------------------------------------

noremap <m-H> <c-w>h
noremap <m-L> <c-w>l
noremap <m-J> <c-w>j
noremap <m-K> <c-w>k
inoremap <m-H> <esc><c-w>h
inoremap <m-L> <esc><c-w>l
inoremap <m-J> <esc><c-w>j
inoremap <m-K> <esc><c-w>k

if has('terminal') && exists(':terminal') == 2 && has('patch-8.1.1')
    " vim 8.1 支持 termwinkey ，不需要把 terminal 切换成 normal 模式
    " 设置 termwinkey 为 CTRL 加减号（GVIM），有些终端下是 CTRL+?
    " 后面四个键位是搭配 termwinkey 的，如果 termwinkey 更改，也要改
    set termwinkey=<c-_>
    tnoremap <m-H> <c-_>h
    tnoremap <m-L> <c-_>l
    tnoremap <m-J> <c-_>j
    tnoremap <m-K> <c-_>k
    tnoremap <m-q> <c-\><c-n>
    tnoremap <m-f> <c-right>
    tnoremap <m-b> <c-left>

    " tab 切换
    tnoremap ]g <c-_>:tabnext<cr>
    tnoremap [g <c-_>:tabprevious<cr>
    tnoremap [G <c-_>:tabfirst<cr>
    tnoremap ]G <c-_>:tablast<cr>

elseif has('nvim')
    " neovim 没有 termwinkey 支持，必须把 terminal 切换回 normal 模式
    tnoremap <m-H> <c-\><c-n><c-w>h
    tnoremap <m-L> <c-\><c-n><c-w>l
    tnoremap <m-J> <c-\><c-n><c-w>j
    tnoremap <m-K> <c-\><c-n><c-w>k
    tnoremap <m-q> <c-\><c-n>
endif



"----------------------------------------------------------------------
" 编译运行 C/C++ 项目
" 详细见：http://www.skywind.me/blog/archives/2084
"----------------------------------------------------------------------

" 自动打开 quickfix window ，高度为 10
let g:asyncrun_open = 10

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" " 设置 F10 打开/关闭 Quickfix 窗口
" nnoremap <leader>10 :call asyncrun#quickfix_toggle(6)<cr>

" F9 编译 C/C++ 文件
nnoremap <silent> <leader>9 :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" F8 运行项目
nnoremap <silent> <leader>8 :AsyncRun -cwd=<root> -raw make run <cr>

" F7 编译项目
nnoremap <silent> <leader>7 :AsyncRun -cwd=<root> make <cr>

" F6 测试项目
nnoremap <silent> <leader>6 :AsyncRun -cwd=<root> -raw make test <cr>

" F5 运行文件
nnoremap <silent> <leader>5 :call ExecuteFile()<cr>

" 更新 cmake
nnoremap <silent> <leader>4 :AsyncRun -cwd=<root> cmake . <cr>

" 生成o 文件
nnoremap <silent> <leader>3 :AsyncRun gcc -std=c99 -Og -c "$(VIM_FILEPATH)" <cr>

" 反汇编
nnoremap <silent> <leader>1 :vertical terminal objdump -d %:r.o<cr>

" Windows 下支持直接打开新 cmd 窗口运行
if has('win32') || has('win64')
    nnoremap <silent> <leader>8 :AsyncRun -cwd=<root> -mode=4 make run <cr>
endif


"----------------------------------------------------------------------
" F5 运行当前文件：根据文件类型判断方法，并且输出到 quickfix 窗口
"----------------------------------------------------------------------
function! ExecuteFile()
    let cmd = ''
    if index(['c', 'cpp', 'rs', 'go'], &ft) >= 0
        " native 语言，把当前文件名去掉扩展名后作为可执行运行
        " 写全路径名是因为后面 -cwd=? 会改变运行时的当前路径，所以写全路径
        " 加双引号是为了避免路径中包含空格
        let cmd = '"$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
    elseif &ft == 'python'
        let $PYTHONUNBUFFERED=1 " 关闭 python 缓存，实时看到输出
        let cmd = 'python "$(VIM_FILEPATH)"'
    elseif &ft == 'javascript'
        let cmd = 'node "$(VIM_FILEPATH)"'
    elseif &ft == 'typescript'
        let cmd = 'ts-node "$(VIM_FILEPATH)"'
    elseif &ft == 'perl'
        let cmd = 'perl "$(VIM_FILEPATH)"'
    elseif &ft == 'ruby'
        let cmd = 'ruby "$(VIM_FILEPATH)"'
    elseif &ft == 'php'
        let cmd = 'php "$(VIM_FILEPATH)"'
    elseif &ft == 'lua'
        let cmd = 'lua "$(VIM_FILEPATH)"'
    elseif &ft == 'zsh'
        let cmd = 'zsh "$(VIM_FILEPATH)"'
    elseif &ft == 'ps1'
        let cmd = 'powershell -file "$(VIM_FILEPATH)"'
    elseif &ft == 'vbs'
        let cmd = 'cscript -nologo "$(VIM_FILEPATH)"'
    elseif &ft == 'sh'
        let cmd = 'bash "$(VIM_FILEPATH)"'
    else
        return
    endif
    " Windows 下打开新的窗口 (-mode=4) 运行程序，其他系统在 quickfix 运行
    " -raw: 输出内容直接显示到 quickfix window 不匹配 errorformat
    " -save=2: 保存所有改动过的文件
    " -cwd=$(VIM_FILEDIR): 运行初始化目录为文件所在目录
    if has('win32') || has('win64')
        exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=4 '. cmd
    else
        exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=0 '. cmd
    endif
endfunc



"----------------------------------------------------------------------
" F2 在项目目录下 Grep 光标下单词，默认 C/C++/Py/Js ，扩展名自己扩充
" 支持 rg/grep/findstr ，其他类型可以自己扩充
" 不是在当前目录 grep，而是会去到当前文件所属的项目目录 project root
" 下面进行 grep，这样能方便的对相关项目进行搜索
"----------------------------------------------------------------------
if executable('rg')
    noremap <silent><leader>2 :AsyncRun! -cwd=<root> rg -n --no-heading 
                \ --color never -g *.h -g *.c* -g *.py -g *.js -g *.vim 
                \ <C-R><C-W> "<root>" <cr>
elseif has('win32') || has('win64')
    noremap <silent><leader>2 :AsyncRun! -cwd=<root> findstr /n /s /C:"<C-R><C-W>" 
                \ "\%CD\%\*.h" "\%CD\%\*.c*" "\%CD\%\*.py" "\%CD\%\*.js"
                \ "\%CD\%\*.vim"
                \ <cr>
else
    noremap <silent><leader>2 :AsyncRun! -cwd=<root> grep -n -s -R <C-R><C-W> 
                \ --include='*.h' --include='*.c*' --include='*.py' 
                \ --include='*.js' --include='*.vim'
                \ '<root>' <cr>
endif
