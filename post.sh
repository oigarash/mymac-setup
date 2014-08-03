#!/bin/bash

# Some variables
setup_path="~/Dropbox/mac_setup"

### Zsh 
# Change default shell to zsh via homebrew
sudo sh -c 'echo "/usr/local/bin/zsh\n" >> /etc/shells'
chpass -s /usr/local/bin/zsh

# zsh setting
### download antigen.zsh
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/antigen.zsh

### link zsh setting files
ln -s "${setup_path}"/.zshrc ~/.zshrc
ln -s "${setup_path}"/.zshrc.antigen ~/.zshrc.antigen
ln -s "${setup_path}"/.zshenv ~/.zshenv

# Vim
### install NeoBundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

### link vim setting files
ln -s "${setup_path}"/.vimrc ~/.vimrc
ln -s "${setup_path}"/.vimrc.neobundle ~/.vimrc.neobundle
ln -s "${setup_path}"/.gvimrc ~/.gvimrc

# Sublime Text 3
st3_packages_path="~/Application Support/Sublime Text 3/Packages"
### Install Package Control
curl -L https://sublime.wbond.net/Package%20Control.sublime-package > "${st3_packages_path}"/Installed\ Packages

### link User settings
ln -s "${setup_path}"/../dev/Sublime/User3 "${st3_packages_path}"/User 


### Mac Function
# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -boolean true

# Add/Remove Application to Dock using dockutil
dockutil --move 'System Preferences' --position 2
dockutil --add '/Applications/Utilities/Activity Monitor.app'
dockutil --move 'Activity Monitor' --after 'System Preferences'

dockutil --add '/Applications/iTerm.app'
dockutil --move 'iTerm' --after 'Activity Monitor'

dockutil --add '/Applications/Firefox.app'
dockutil --move 'Firefox' --after 'Safari'

dockutil --add '/Applications/Google Chrome.app'
dockutil --move 'Google Chrome' --after 'Firefox'

dockutil --remove 'Launchpad'
dockutil --remove 'Photo Booth'
dockutil --remove 'iBooks'
dockutil --remove 'FaceTime'
dockutil --add '/Applications/Sublime Text 3.app'
