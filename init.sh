#!/bin/bash

DOTFILES_DIR=~/dotfiles

sudo apt update
sudo apt install -y git vim tmux

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ -d "$DOTFILES_DIR" ]; then
    cd "$DOTFILES_DIR"
    git pull origin master
else
    git clone https://github.com/ducpa-bap/dotfiles.git "$DOTFILES_DIR"
fi

mv ~/.gitconfig ~/.gitconfig_bk
# mv ~/.vimrc ~/.vimrc_bk
# mv ~/.tmux.conf ~/.tmux.conf_bk
# mv ~/.zshrc ~/.zshrc_bk

ln -sf "$DOTFILES_DIR/dot/.gitconfig" ~/.gitconfig
# ln -sf "$DOTFILES_DIR/.bashrc" ~/.bashrc
# ln -sf "$DOTFILES_DIR/.vimrc" ~/.vimrc
# ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf
