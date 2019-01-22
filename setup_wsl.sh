#!/bin/sh

# Win側で
# - http://github.com/Microsoft/console のツールで
#     ColorTool.exe -b OneHalfDark
# - 端末のプロパティでフォントと画面サイズ変更

sudo apt update
sudo apt upgrade
sudo apt-add-repository ppa:kellyk/emacs
sudo apt install \
     git \
     emacs26

git clone http://github.com/syl20bnr/spacemacs ~/.emacs.d
mkdir -p ~/github
ln -s ~/emacs.d ~/github/spacemacs

echo alias emacs='emacsclient -nw -a ""'>> .bashrc

eval $(ssh-agent -s)
ssh-keygen
ssh-add
