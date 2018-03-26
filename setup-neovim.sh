#!/bin/bash

echo "Setting up neovim..."

# Install neovim
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  distro=$(awk -F= '/^NAME/{ print $2 }' /etc/os-release | sed 's/"//g')
  if [[ "$distro" == "Ubuntu" ]]; then
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install neovim
  else
    echo "Only supports Ubuntu distros. Aborting setup."
    exit 1
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install neovim
else
  exit 1
fi

# Configure vim-plug
echo "Setting up vim-plug..."

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy neovim configuration
echo "Configuring init.vim..."
mkdir -p $HOME/.config/nvim
if [[ ! -f $HOME/.config/nvim/init.vim ]]; then
  ln -s $HOME/dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim
else
  echo "$HOME/.config/nvim/init.vim already exists."
fi

# Create a symbolic link of init.vim at ~/.nvimrc
# Does not make a link when ~/.nvimrc already exists
echo "Creating a symbolic link for init.vim at ~/.nvimrc..."
if [[ ! -f ~/.nvimrc ]]; then
  ln -s $HOME/.config/nvim/init.vim $HOME/.nvimrc
else
  echo "$HOME/.nvimrc already exists. Omitting the symbolic link process."
fi

# Install neovim plugins
echo "Installing neovim plugins..."
nvim --headless +PlugInstall +qall

echo "neovim setup complete!"
