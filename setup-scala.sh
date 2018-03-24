#!/bin/bash

echo "Setting up a scala development environment..."

if [[ "$OSTYPE" == "linux-gnu" ]]; then  
  distro=$(awk -F= '/^NAME/{ print $2 }' /etc/os-release | sed 's/"//g')
  if [[ "$distro" == "Ubuntu" ]]; then
    echo "Installing SBT..."

    echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
    sudo apt update
    sudo apt install sbt

    echo "Installing Scala 2.12.4..."
    sudo wget http://scala-lang.org/files/archive/scala-2.12.4.deb
    sudo dpkg -i scala-2.12.4.deb
    rm -f scala-2.12.4.deb

    echo "Not installing Dotty for Ubuntu."
    echo "Visit http://dotty.epfl.ch/ if you need to."
  else
    echo "Only supports Ubuntu distros. Aborting setup."
    exit 1
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew update

  echo "Installing SBT..."
  brew install sbt

  echo "Configuring global SBT plugins..."
  mkdir -p ~/.sbt/1.0/plugins
  cp scala/sbt/plugins.sbt ~/.sbt/1.0/plugins/plugins.sbt

  echo "Installing Scala..."
  brew install scala

  echo "Installing Dotty..."
  brew install lampepfl/brew/dotty
else
  echo "$OSTYPE not supported."
  exit 1
fi

echo "Completed setting up a scala development environment!"

