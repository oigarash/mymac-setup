#!/bin/bash

### Zsh 
# Change default shell to zsh via homebrew
sudo "\n/usr/local/bin/zsh" >> /etc/shells
chpass -s /usr/local/bin/zsh

# zsh setting
ln -s ~/Dropbox/mac_setup/.zshrc ~/.zshrc
ln -s ~/Dropbox/mac_setup/.zshrc.antigen ~/.zshrc.antigen
ln -s ~/Dropbox/mac_setup/.zshenv ~/.zshenv

### Vim


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

dockutil --remove 'LaunchPad'
dockutil --remove 'Photo Booth'
dockutil --remove 'iBooks'
dockutil --remove 'FaceTime'
dockutil --add '/Applications/Sublime Text 2.app'
