#!/usr/bin/env bash

print_nicely () {
    echo ""
    printf "$1" "$2"
    echo ""
}

#print_nicely "Detected OS Type [Linux/Bash on Windows 10/Android:linux-gnu, MacOS:darwin*, iOS:darwin9]: %s", $OSTYPE

var=`python3 -V`

if [[ "$var" == "Python"* ]]; then
    print_nicely "Installed Python: %s" "$var"
else 
    print_nicely "Installing Python to the system" ""
    if ["$OSTYPE" == linux-gnu]; then
        apt-get install python3.15
    elif ["$OSTYPE" == darwin9]; then 
        echo "Not possible to install Python on iPhone"
    elif ["$OSTYPE" ==  darwin*]; then
        brew install python
    print_nicely "Installed Python: %s" "$var"
    fi
fi

var2=`pip -V`
if [[ "$var2" == "pip"* ]]; then
    print_nicely "Installed pip: %s" "$var2"
else 
    print_nicely "Installing pip to the system" ""
    python -m pip install --upgrade pip
    print_nicely "Installed pip: %s" "$var2"
    fi

var3=`which jupyter`
if [[ "$var3" == "/"* ]]; then
    print_nicely "Installed jupyter via path: %s" "$var3"
else 
    print_nicely "Installing jupyter to the system" ""
    pip install jupyter
    print_nicely "Installed jupyter to path: %s" "$var3"
    fi