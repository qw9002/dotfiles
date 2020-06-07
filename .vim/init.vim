""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"  init.vim - intialize config
"
"  Created by shiqf on 2019-06-29 23:00
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 防止重复加载
if get(s:, 'loaded', 0) != 0
    finish
else
    let s:loaded = 1
endif

" 取得本文件所在的目录
let s:home = '~/.vim'

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'

"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------

" 加载基础配置
LoadScript init/init-basic.vim

" 加载终端相关配置
LoadScript init/init-config.vim

" 设定个人的 tabsize
LoadScript init/init-tabsize.vim

" 插件加载
LoadScript init/init-plugins.vim

" 状态栏界面样式
LoadScript init/init-style.vim

" 自定义按键
LoadScript init/init-keymaps.vim
