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
brew cask install xquarts 

brew install python  
brew install python2 
brew install git 
brew install openssl 
brew install wget 
brew install curl 
brew install libtool  
brew install ruby 
brew install ruby193 
brew install jruby 
brew install node 

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

brew cask install sublime-text 
brew cask install iterm2 

#### enable Alfred to follow symbolic link
brew cask alfred link

### TODO
### brew cask install clearn-archiver 
### brew cask install  

## Almost
brew cask install haskell-platform 

### Jetbrains app
brew cask install pycharm 
brew cask install rubymine 
brew cask install intellij-idea 

### Eclipse
brew cask install eclipse-java 

brew cask install google-drive 
brew cask install evernote 
brew cask install skitch 
brew cask install github 
brew cask install clipmenu 

### TODO
### brew cask install cloudapp 


## Maybe
brew cask install macvim 
brew cask install bbedit 
brew cask install atom 

### Entertainment
brew cask install audio-hijack-pro 
brew cask install handbrake 
brew cask install ps3-media-server 

### TODO
### brew cask install paste-bot 
