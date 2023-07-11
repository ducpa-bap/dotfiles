#!/bin/bash

dotfiles_dir="$HOME/.dotfiles"
repository_url=git@github.com:ducpa-bap/dotfiles.git

if [ -d "$dotfiles_dir" ]; then
  git -C "$dotfiles_dir" pull origin
else
  git clone "$repository_url" "$dotfiles_dir"
fi

for file in "$dotfiles_dir/dot"/*; do
  base_file_name = $(basename "$file")
  if [ -f "$file" ] && [ "$base_file_name" != ".." ]; then
    echo "Installing $base_file_name"
    ln -sfn "$dotfiles_dir/$base_file_name" "$HOME/.$base_file_name"
  fi
done