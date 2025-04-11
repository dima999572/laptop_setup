#!/bin/bash

install plugin() {
  local plugin_name=$1
  local plugin_url=$2
  local plugin_dir="$HOME/.oh-my-zsh/plugins/zsh-autosuggestions"
  local zshrc_path="$HOME/.zshrc"

  if [ ! -d "$plugin_dir" ]; then
    echo "$plugin_name not found, installing..."
    git clone "$plugin_url" "$plugin_dir"
  else
    echo "$plugin_name is already installed"
  fi
  if ! grep -q "$plugin_name" "$zsh_path"; then
    echo "Adding $plugin_name to $ZSHRC_PATH"
    sed -i '' "/^plugins=(/a\\
      $plugin_name" "$zshrc_path"

  else
    echo "$plugin_name is already in $zshrc_path"
  fi
}


plugins=(
    "zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions",
    "zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting"
)

for plugin in "${plugins[@]}"; do
  plugin_name=$(echo $plugin | awk '{print $1}')
  plugin_url=$(echo $plugin | awk '{print $2}')
  install_plugin "$plugin_name" "$plugin_url"
done
