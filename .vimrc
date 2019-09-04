if has('win32') || has('win64')
    " windows 系统创建软链接时，并不是软链接而是实际的文件
    source ~/dotfiles/.vim/init.vim
else
    source ~/.vim/init.vim
endif
