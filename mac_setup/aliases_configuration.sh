#!/bin/bash

add_aliases() {
  local alias_path="ZSH_CUSTOM/aliases.zsh"
  local aliases=("$@")
  local zshrc_path="$HOME/.zshrc"

  if [ ! -f "$alias_path" ]; then
    echo "Alias file not found, creating $alias_path"
    touch "$alias_path"
  fi

  for alias_to_add in "${aliases[@]}"; do
    echo "$alias_to_add" >> "$alias_path"
  fi
}


aliases=(
  "alias k=kubectl"
)
