#!/bin/bash

# Ask sudo password to install 
stty -echo # disable input
echo -n "Enter Password: "
read password
echo "\n"
echo -n "Enter Password(confirm): "
read password2
stty echo

if [ "${password}" != "${password2}" ]; then
	echo "Passwords are not matched"
	exit
fi

# Ask some individual information
echo -n "Enter Your Name: "
read name 
echo "\n"
echo -n "Enter Your email address: "
read email

password="${password}\n"

# At first, disable sudo timeout
echo "SETUP: Disable sudo timeout."
expect -c "
set timeout 60
spawn sudo sh -c 'echo \"\nDefaults timestamp_timeout=-1\">>/etc/sudoers'
expect \"Password\"
send ${password}
interact
"
# Pre check sequence
### Check System Language is English

### Check XCode and Command Line Tools are installed

# Execute brew install
echo "SETUP: Trying to install applications from Homebrew...\n"
expect -c "
set timeout 60
spawn ./brewfile.sh
expect \"Press RETURN\"
send \"\n\"
expect \"Password\"
send ${password}
interact
" 

# Execute Environment settings
echo "SETUP: Trying to setup environmet."
expect -c "
set timeout 60
spawn ./post.sh
expect \"Password\"
sent ${password}
interact
"

# Remove disabling timeout 
echo "SETUP: Enable sudo timeout"
expect -c "
set timeout 60
swpan sudo sh -c 'echo sed -i \"/Defaults timestamp_timeout=-1/d\" /etc/sudoers'
expect \"Password\"
send ${password}
interact
"

