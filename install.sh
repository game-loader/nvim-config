#!/bin/bash

# Check OS type
if [[ "$(uname)" == "Darwin" ]]; then
  OS="macos"
elif [[ "$(cat /etc/*-release | grep -c "ID=debian")" -gt 0 ]]; then
  OS="debian"
elif [[ "$(cat /etc/*-release | grep -c "ID=ubuntu")" -gt 0 ]]; then
  OS="ubuntu"
elif [[ "$(cat /etc/*-release | grep -c "ID=manjaro")" -gt 0 ]]; then
  OS="manjaro"
else
  echo "Unsupported OS"
  exit 1
fi

# Install packages
if [[ "$OS" == "macos" ]]; then
  brew install unzip wget curl gzip ruby go node python git rust npm fzf lazygit
elif [[ "$OS" == "debian" ]] || [[ "$OS" == "ubuntu" ]]; then
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt-get update
  sudo apt-get install -y unzip wget curl gzip tar ruby git cargo npm xclip fzf
  sudo apt-get install -y python3 python3-venv python3-pip nodejs neovim
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
elif [[ "$OS" == "manjaro" ]]; then
  sudo pacman -Syu --noconfirm
  sudo pacman -S --noconfirm unzip wget curl gzip tar ruby git cargo npm
  sudo pacman -S --noconfirm python python-pip fzf lazygit
  sudo pacman -S --noconfirm go nodejs neovim
fi

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim


# Add Go to PATH
if [[ "$OS" == "macos" ]]; then
  # Mac users should use Homebrew to install Go instead of this script
  exit 0
elif [[ "$OS" == "debian" ]] || [[ "$OS" == "ubuntu" ]] ; then
  GO_LATEST=$(curl -sL "https://golang.org/VERSION?m=text" | sed 's/go//')
  curl  https://mirrors.aliyun.com/golang/go$GO_LATEST.linux-amd64.tar.gz | sudo tar -C /usr/local -xz
  echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
fi

source ~/.bashrc
