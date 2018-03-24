#!/bin/bash

echo "Setting up zsh..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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

ln -s zsh/zshrc.main $HOME/.zshrc.main
if [[ ! -f $HOME/.zshrc ]]; then
  cp zsh/zshrc $HOME/.zshrc
fi

echo "Completed setting up zsh!"
