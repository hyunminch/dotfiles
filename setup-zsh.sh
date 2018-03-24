#!/bin/bash

echo "Setting up zsh..."

if [[ "$OSTYPE" == "linux-gnu" ]]; then  
  sudo apt install zsh
  sudo chsh -s /bin/zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install zsh
  sudo chsh -s /usr/local/bin/zsh
else
  echo "$OSTYPE not supported."
  exit 1
fi

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Copying zshrc to ~/.zshrc..."
mkdir -p $HOME/go

if [[ ! -f $HOME/.zshrc.main ]]; then
  ln -s $HOME/dotfiles/zsh/zshrc.main $HOME/.zshrc.main
else
  echo "$HOME/.zshrc.main already exists. zsh setup may be incomplete."
fi

if [[ ! -f $HOME/.zshrc ]]; then
  cp zsh/zshrc $HOME/.zshrc
else
  echo "$HOME/.zshrc already exists. zsh setup may be incomplete."
fi

source $HOME/.zshrc

echo "Completed setting up zsh!"
