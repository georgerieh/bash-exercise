#!/usr/bin/env bash

print_nicely () {
    printf "\n$1\n" "$2"
}

#print_nicely "Detected OS Type [Linux/Bash on Windows 10/Android:linux-gnu, MacOS:darwin*, iOS:darwin9]: %s", $OSTYPE
install_python () {
var=`python3 -V`

if [[ "$var" == "Python"* ]]; then
    print_nicely "Installed Python: %s" "$var"
else 
    print_nicely "Installing Python to the system" ""
    if [ "$OSTYPE" == "linux-gnu" ]; then
        apt-get install python3.15
    elif [ "$OSTYPE" == "darwin9" ]; then 
        echo "Not possible to install Python on iPhone"
    elif [ "$OSTYPE" == "darwin*" ]; then
        brew install python
    else 
        echo "OS not supported for auto-install"
    fi
    var=`python3 -V`
    print_nicely "Installed Python: %s" "$var"
fi
}

install_pip () {
var2=`pip -V`
if [[ "$var2" == "pip"* ]]; then
    print_nicely "Installed pip: %s" "$var2"
else 
    print_nicely "Installing pip to the system" ""
    python3 -m ensurepip --upgrade
    python3 -m pip install --upgrade pip
    var2=`pip -V`
    print_nicely "Installed pip: %s" "$var2"
    fi
}

install_jupyter () {
var3=`which jupyter`
if [[ "$var3" == "/"* ]]; then
    print_nicely "Installed jupyter via path: %s" "$var3"
else 
    print_nicely "Installing jupyter to the system" ""
    pip3 install jupyter
    var3=`which jupyter`
    print_nicely "Installed jupyter to path: %s" "$var3"
    fi
}

check_health () {
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew doctor
    fi
}

print_nicely "=======================\nStarting Installation\n=======================" ""
install_python
install_pip
install_jupyter
print_nicely "=======================\nUpdating packages\n=======================" ""
sudo apt-get update
print_nicely "=======================\nHtop installation\n=======================" ""
sudo apt install htop
print_nicely "=======================\nInstallation Complete\n=======================" ""

