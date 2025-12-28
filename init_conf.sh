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
elif [ -f /etc/centos-release ]; then
    OS=CentOS
    VER=`cat /etc/centos-release | awk -F 'release ' '{print $2}' | cut -d ' ' -f 1`
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

echo "OS Information : [$OS] [$VER] [$ARCH]"
read -p "Is Right? n/N to exit " char
if [ x$char == xn ] || [ x$char == xN ]; then
    echo "Bug. Stupid develpoer"
    exit
fi

### Check install command
case "$OS" in 
*CENTOS* | *REDHAT*)
    COMM_INSTALL="yum install -y"
    yum -y update
    ;;
*UBUNTU*)
    COMM_INSTALL="apt install -y"
    apt-get -y update
    ;;
esac

## 2. Install essential package
$COMM_INSTALL epel-release
$COMM_INSTALL vim vim-enhanced tmux git net-tools nmap tcpdump

## 3. Z shell
$COMM_INSTALL zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
if [ $? -ne 0 ]; then
    exit
fi
sed -e '0,/ZSH_THEME/ s/^#*/#/' -i /root/.zshrc
sed -i '/^#.*export ZSH/s/^#//' /root/.zshrc
sed -i '/^plugins/d' /root/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
curl https://raw.githubusercontent.com/booraik/configuration/master/zshrc >> ~/.zshrc
cp /root/.zshrc /root/.zshenv
chsh -s /bin/zsh root

## 4. Fuzzy Finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

## 5. vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 

curl https://raw.githubusercontent.com/booraik/configuration/master/vimrc >> /etc/vimrc	# for centos
curl https://raw.githubusercontent.com/booraik/configuration/master/vimrc >> /etc/vim/vimrc	# for ubuntu
curl https://raw.githubusercontent.com/booraik/configuration/master/.vimrc >> ~/.vimrc  # for current user
cp ~/.vimrc /etc/skel/          # for new user
vim +PluginInstall +qall


## 6. Write Configuration files
curl https://raw.githubusercontent.com/booraik/configuration/master/profile >> /etc/profile
curl https://raw.githubusercontent.com/booraik/configuration/master/tmux.conf >> /etc/tmux.conf

## 7. Other config

