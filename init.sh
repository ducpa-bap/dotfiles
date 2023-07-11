#!/bin/bash

dotfiles_dir="$HOME/.dotfiles"
repository_url=git@github.com:ducpa-bap/dotfiles.git

if [ -d "$dotfiles_dir" ]; then
  git -C "$dotfiles_dir" pull origin
else
  git clone "$repository_url" "$dotfiles_dir"
fi

for file in "$dotfiles_dir/dot"/*; do
  if [ -f "$file" ] && [ "$(basename "$file")" != ".." ]; then
    echo "Installing $(basename "$file")"
    ln -sfn "$dotfiles_dir/$(basename "$file")" "$HOME/.$(basename "$file")"
  fi
done