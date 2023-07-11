#!/bin/bash

dotfiles_dir="$HOME/.dotfiles"
repository_url=git@github.com:ducpa-bap/dotfiles.git

# Kiểm tra xem thư mục .dotfiles có tồn tại hay không
if [ -d "$dotfiles_dir" ]; then
  # Thư mục .dotfiles đã tồn tại, pull code mới nhất từ repository
  git -C "$dotfiles_dir" pull origin
else
  # Thư mục .dotfiles chưa tồn tại, clone repository vào thư mục .dotfiles
  git clone "$repository_url "$dotfiles_dir"
fi
