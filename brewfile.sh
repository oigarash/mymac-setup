#!/bin/bash

# install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# export CASK Options
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Keep Brew latest
brew update  
brew upgrade 
 
# Environment settings
### Seems not needed now.
### http://qiita.com/macoshita/items/09c730e5a281897365eb
 
# Install from Brew repo
brew install caskroom/cask/brew-cask

#### Some needs xquarts
brew cask install xquartz

brew install zsh  
brew install python  
brew install python2 
brew install git 
brew install openssl 
brew install wget 
brew install curl 
brew install libtool  
brew install ruby 
brew install jruby 
brew install node 
brew install tmux


# Mange Dock https://github.com/kcrawford/dockutil
brew install dockutil

# Install from Brew Cask Repo

## Must
brew cask install caskroom/versions/java7
brew cask install java 

brew cask install the-unarchiver 
brew cask install xtrafinder 
brew cask install karabiner 
brew cask install google-chrome 
brew cask install firefox 
brew cask install alfred 
brew cask install dropbox 
brew cask install google-japanese-ime 
brew cask install onepassword

brew cask install sublime-text3 
brew cask install marked
brew cask install iterm2
brew cask install transmit

brew cask install sizeup

#### enable Alfred to follow symbolic link
brew cask alfred link

### TODO
### brew cask install clearn-archiver 
### brew cask install  

## Almost
brew cask install vmware-fusion
brew cask install haskell-platform 
brew cask install onyx 

### Jetbrains app
brew cask install pycharm 
brew cask install rubymine 
brew cask install intellij-idea 
### brew cask install webstorm

### Eclipse
brew cask install eclipse-java 

brew cask install google-drive 
brew cask install evernote 
brew cask install skitch 
brew cask install github 
brew cask install clipmenu 
brew cask install sourcetree

### TODO: brew cask install cloudapp 

## Maybe
brew cask install macvim 
brew cask install bbedit 
brew cask install atom 

### For DevTest
brew cask install sublime-text

### For work
brew install wireshark
#### TODO: brew cask install msoffice 
#### TODO: brew cask install translatorx

### For Home
brew cask install vlc
brew cask install audio-hijack-pro 
brew cask install handbrake 
brew cask install ps3-media-server 
brew cask install name-mangler
brew cask install simple-comic
brew cask install transmission


### TODO: brew cask install paste-bot 
