#!/bin/bash

repo_dir="$HOME/.dotfiles"
dotfiles_dir="$repo_dir/dot"
repository_url=https://github.com/ducpa-bap/dotfiles.git

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

save_file() {
  local file_path="$1"
  local content="$2"

  # Lấy đường dẫn thư mục chứa từ đường dẫn tệp
  local dir_path=$(dirname "$file_path")

  # Tạo thư mục chứa nếu chưa tồn tại
  mkdir -p "$dir_path"

  # Lưu nội dung vào tệp
  echo "$content" > "$file_path"
}

# Install zsh
if test ! $(which omz); then
  echo "...Installing ZSH"
  sudo apt install -y zsh
  save_file "$HOME/.oh-my-zsh/custom/themes/agnosterzak.zsh-theme" "$(curl -s https://raw.githubusercontent.com/zakaziko99/agnosterzak-ohmyzsh-theme/master/agnosterzak.zsh-theme)"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi