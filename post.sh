#!/bin/bash

# Some variables
user=$1
email=$2
setup_path="~/Dropbox/mac_setup"

### Git
# git inital settings
git config --global user.name "${user}"
git config --global user.email "${email}"

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
st3_app_path="${HOME}/Library/Application Support/Sublime Text 3"
st3_packages_path="${st3_app_path}/Packages"
st3_install_packages_path="${st3_app_path}/Installed Packages"

if [ ! -e "${st3_app_path}" ]; then 
	mkdir "${st3_app_path}"
fi
if [ ! -e "${st3_packages_path}" ]; then 
	mkdir "${st3_packages_path}"
fi
if [ ! -e "${st3_install_packages_path}" ]; then 
	mkdir "${st3_install_packages_path}"
fi

### Install Package Control
package_control="${st3_install_packages_path}/Package Control.sublime-package"
curl -L https://sublime.wbond.net/Package%20Control.sublime-package > "${package_control}"

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
