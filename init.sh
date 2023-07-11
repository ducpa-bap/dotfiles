#!/bin/bash

repo_dir="$HOME/.dotfiles"
dotfiles_dir="$repo_dir/dot"
repository_url=git@github.com:ducpa-bap/dotfiles.git

if [ -d "$repo_dir" ]; then
  git -C "$repo_dir" pull origin
else
  git clone "$repository_url" "$repo_dir"
fi

for file in "$dotfiles_dir"/*; do
  if [ -f "$file" ] && [ "$(basename "$file")" != ".." ]; then
    echo "...Installing .$(basename "$file")"
    ln -sfn "$dotfiles_dir/$(basename "$file")" "$HOME/.$(basename "$file")"
  fi
done