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
  brew install unzip wget curl gzip tar ruby go node python git cargo npm
elif [[ "$OS" == "debian" ]] || [[ "$OS" == "ubuntu" ]]; then
  sudo apt-get update
  sudo apt-get install -y unzip wget curl gzip tar ruby git cargo npm
  sudo apt-get install -y python3 python3-pip node
  curl -LO https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-linux64.deb # Added this line to download neovim deb package
  sudo apt install ./nvim-linux64.deb # Added this line to install neovim deb package
elif [[ "$OS" == "manjaro" ]]; then
  sudo pacman -Syu --noconfirm
  sudo pacman -S --noconfirm unzip wget curl gzip tar ruby git cargo npm
  sudo pacman -S --noconfirm python python-pip
  sudo pacman -S --noconfirm go nodejs neovim
fi

# Add Go to PATH
if [[ "$OS" == "macos" ]]; then
  # Mac users should use Homebrew to install Go instead of this script
  exit 0
elif [[ "$OS" == "debian" ]] || [[ "$OS" == "ubuntu" ]] || [[ "$OS" == "manjaro" ]]; then
  GO_LATEST=$(curl -sL https://golang.org/VERSION?m=text | sed 's/go//')
  curl -s https://mirrors.aliyun.com/golang/go$GO_LATEST.linux-amd64.tar.gz | sudo tar -C /usr/local -xz
  echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
fi
