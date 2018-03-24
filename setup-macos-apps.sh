#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Installing Slack and iTerm2..."
  brew cask install slack
  brew cask install iterm2
fi
