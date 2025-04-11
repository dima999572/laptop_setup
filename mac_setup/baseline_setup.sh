#!/bin/bash

install_homebrew() {
  if ! command -v brew &> /dev/null; then
    echo "Homebrew not found, installing..."
    curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    /bin/bash install.sh
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    rm install.sh
  else
    echo "Homebrew is already installed"
  fi
}


install_oh_my_zsh() {
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh not found, installing..."
    curl -L https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
  else
    echo "Oh My Zsh is already installed"
  fi
}


install_homebrew
install_oh_my_zsh
