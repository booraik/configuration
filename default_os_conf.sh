#!/bin/bash
## 1. Check OS information
## 2. Install essential package
## 3. Write Configuration files
## 4. Other config

OS=""
VER=""
ARCH=""
COMM_INSTALL=""

## 1. Check OS information
### Check OS Distribution & version
if [ -f /etc/os-release ]; then # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then # Older SuSE/etc.
    ...
elif [ -f /etc/redhat-release ]; then # Older Red Hat, CentOS, etc.
    ...
else # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
fi
OS=`echo $OS | awk '{print toupper($0)}'`
### Check architecture
case $(uname -m) in
x86_64)
    ARCH=x64  # or AMD64 or Intel64 or whatever
    ;;
i*86)
    ARCH=x86  # or IA32 or Intel32 or whatever
    ;;
*)
    # leave ARCH as-is
    ;;
esac
### Check install command
case "$OS" in 
*CENTOS* | *REDHAT*)
    COMM_INSTALL="yum install -y"
    ;;
esac

echo "OS Information : [$OS] [$VER] [$ARCH]"
read -p "Is Right? n/N to exit " char
if [ x$char == xn ] || [ x$char == xN ]; then
    echo "Bug. Stupid develpoer"
    exit
fi

## 2. Install essential package
$COMM_INSTALL vim-enhanced zsh tmux git
if [ $? -ne 0 ]; then
    exit
fi
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
if [ $? -ne 0 ]; then
    exit
fi

## 3. Write Configuration files
curl https://raw.githubusercontent.com/booraik/configuration/master/profile >> /etc/profile
curl https://raw.githubusercontent.com/booraik/configuration/master/vimrc >> /etc/vimrc
curl https://raw.githubusercontent.com/booraik/configuration/master/zshrc >> ~/.zshrc
curl https://raw.githubusercontent.com/booraik/configuration/master/tmux.conf >> /etc/tmux.conf

## 4. Other config
# zsh
sed -e '0,/ZSH_THEME/ s/^#*/#/' -i /root/.zshrc
