#!/bin/bash

echo "Bootstrapping dotfiles..."

./setup-packages.sh
./setup-neovim.sh
./setup-zsh.sh
./setup-macos-apps.sh
./setup-scala.sh

echo "Bootstrap complete!"
