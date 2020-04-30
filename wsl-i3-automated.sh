#!/bin/bash

# ubuntu install for i3 
echo "alright, let's fuck this pig!"
sleep 1s
echo "grabbing the Airblader fork of i3, commit @fdf5d3a..."
mkdir -p $HOME/gits && cd $HOME/gits
git clone https://github.com/Airblader/i3 $HOME/gits/i3-gaps
echo "grabbing the files needed to compile library xcb-util-xrm..."
sleep 1s
git clone https://github.com/Airblader/xcb-util-xrm $HOME/gits/xcb-util-xrm 
echo "setting commit..."
cd $HOME/gits/;i3-gaps && git checkout fdf5d3a
sleep 1s
echo "let's grab some deps, brah."
sleep 1s
# deps
# ----
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool 
echo "boutique dep creation..."
sleep 1s
cd $HOME/gits/xcb-util-xrm && git submodule update --init 
$HOME/gits/xcb-util-xrm/autogen.sh --prefix=/usr
echo "alright let's make this bitch"
sleep 1
make -j8
echo "wasnt that fun? now shove all that down your pc's gaping software hole"
sleep 1s
sudo make install 
echo "now let's run the drill again, with gapped i3"
sleep 1s
cd $HOME/gits/i3-gaps && autoreconf --force --install
rm -rf $HOME/gits/i3-gaps/build && mkdir $HOME/gits/i3-gaps/build
cd $HOME/gits/i3-gaps/build && $HOME/gits/i3-gaps/configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install 
echo "and there you have it. before launching i3, make sure to run X410 or VcXsrv.exe on the windows side."

# manual compile for a needed dep
# ------------------------------
# mkdir tmp
# cd /tmp
# git clone https://github.com/Airblader/xcb-util-xrm
# cd xcb-util-xrm
# git submodule update --init
# ./autogen.sh --prefix=/usr
# make
# sudo make install 

# i3 build 
# --------
# i3-gaps-rounded: 
# git clone https://github.com/resloved/i3 
# i3-gaps: 
# git clone https://www.github.com/Airblader/i3 i3-gaps
# cd i3-gaps
# git checkout gaps && git pull
# autoreconf --force --install
# rm -rf build
# mkdir build
# cd build
# ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
# make
# sudo make install

# extras
# ------
# sudo apt-get install wget ranger mediainfo highlight tmux calcurse  newsbeuter moc qutebrowser imagemagick transmission-cli atool xcompmgr blender pinta gimp  markdown mupdf evince audacity vim-latexsuite rsync syncthing cups screenfetch scrot unzip unrar biber ntfs-3g deepin-terminal zip irssi unzip

