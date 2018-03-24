#!/bin/bash

echo "Installing basic packages..."

if [[ "$OSTYPE" == "linux-gnu" ]]; then  
  distro=$(awk -F= '/^NAME/{ print $2 }' /etc/os-release | sed 's/"//g')
  if [[ "$distro" == "Ubuntu" ]]; then
    echo "Updating apt..."
    sudo apt update
    echo "Installing utilities..."
    sudo apt install build-essential git vim curl wget screen tmux openjdk-8-jdk
  else
    echo "Only supports Ubuntu distros. Aborting setup."
    exit 1
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Install homebrew
  echo "Installing homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  brew upgrade

  echo "Installing Java 8..."
  brew cask install caskroom/versions/java8
  echo "Installing Python 3..."
  brew install python

  echo "Installing utilities..."
  brew install git vim grep screen tmux curl wget
  brew install gnu-sed --with-default-names
else
  echo "$OSTYPE not supported."
  exit 1
fi

echo "Completed installing basic packages!"
