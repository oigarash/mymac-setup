#!/bin/bash

# Ask sudo password to install 
stty -echo # disable input
echo -n "Enter Password: "
read password
echo -n "Enter Password(confirm): "
read password2
stty echo

if [ "${password}" != "${password2}" ]; then
	echo "Passwords are not matched"
	exit
fi

password="${password}"+"\n"

# At first, disable sudo timeout
sudo sh -c 'echo "\nDefaults timestamp_timeout=-1">>/etc/sudoers'

# Pre check sequence
### Check System Language is English

### Check XCode and Command Line Tools are installed

# Execute brew install
expect "
set timeout 60
spawn ./brewfile.sh
expect \"Password\"
send ${password}
interact
" 

# Execute Environment settings
expect "
set timeout 60
spawn ./post.sh
expect \"Password\"
sent ${password}
"


# Remove disabling timeout 
sudo sed -i "/Defaults timestamp_timeout=-1/d" /etc/sudoers