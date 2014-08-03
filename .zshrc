LANG=ja_JP.UTF-8

### Vim like binding
bindkey -v

### Display multilanguage font
setopt print_eight_bit

### Some tricks to move directory
setopt auto_cd
alias ...='cd ../..'
alias ....='cd ../../..'

### some text substitution
hash -d dbox=~/Dropbox/   # 'cd dbox' means cd ~/Dropbox
hash -d dev=~/Dropbox/dev # 'cd dev' means cd ~/Dropbox/dev

### pushd/popd
# enable autostack 
# show stack by cd +<Tab> 
setopt auto_pushd 

# if dir is already included in stack, no pushd
setopt pushd_ignore_dups

### Enable Extended glob
# regard # ! ^ as wild card pattern
# check 'man zshexpn' for detail
setopt extended_glob

# remove duplicate history also ignore space 
setopt hist_ignore_all_dups
setopt hist_ignore_space

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

alias h='history'

### Plugin Manager
# antigen
source ~/.zshrc.antigen


### Enable auto-complete
autoload -U compinit; compinit

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/oigarash/.gvm/bin/gvm-init.sh" ]] && source "/Users/oigarash/.gvm/bin/gvm-init.sh"
