#!/bin/bash

packages=('git' 'vim' 'zsh' 'nginx')

DOTFILES_DIR=~/dotfiles

for package in ${packages[*]}; do
  if dpkg-query -W -f='${Status}' "$package" 2>/dev/null | grep -q "ok installed"; then
    echo "$package đã được cài đặt."
  else
    echo "Cài đặt $package..."
    sudo apt update
    sudo apt install -y "$package"
  fi
done

if [ -d ~/.oh-my-zsh ]; then
  echo "Oh My Zsh đã được cài đặt."
else
  echo "Cài đặt Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ -d "$DOTFILES_DIR" ]; then
  echo "Thư mục dot đã tồn tại."
  cd "$DOTFILES_DIR"
  # git pull origin master
else
  echo "Tạo mới thư mục dot."
  # git clone https://github.com/ducpa-bap/dotfiles.git "$DOTFILES_DIR"
fi

mv ~/.gitconfig ~/.gitconfig_bk
# mv ~/.vimrc ~/.vimrc_bk
# mv ~/.tmux.conf ~/.tmux.conf_bk
# mv ~/.zshrc ~/.zshrc_bk

ln -sf "$DOTFILES_DIR/files/.gitconfig" ~/.gitconfig
# ln -sf "$DOTFILES_DIR/.bashrc" ~/.bashrc
# ln -sf "$DOTFILES_DIR/.vimrc" ~/.vimrc
# ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf
ln -sf "$DOTFILES_DIR/scripts/alias.sh" ~/.alias

echo "source ~/.alias" >>~/.bashrc
