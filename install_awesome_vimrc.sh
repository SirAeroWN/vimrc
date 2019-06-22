#!/bin/sh
set -e

cd ~/.vim_runtime

echo 'if has("win16") || has("win32")
    set runtimepath+=D:\casa\Vim\.vim_runtime
else
    set runtimepath+=~/.vim_runtime
endif

runtime! vimrc.vim
' > ~/.vimrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
