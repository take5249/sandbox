#!/bin/sh
set -x

# VBox share folder permission
sudo gpasswd --add $(whoami) vboxsf

# home/* directory name
LANG=C xdg-user-dirs-gtk-update

# apt packages
sudo apt-add-repository -y ppa:kelleyk/emacs
sudo apt update
sudo apt install -y \
     ubuntu-gnome-desktop \
     chromium-browser \
     guake \
     git \
     emacs26 \
     meld
    # choose gdm3

mkdir -p ~/github

# spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -s ~/.emacs.d ~/github/spacemacs

# font
wget https://gist.githubusercontent.com/enzinier/8d00d3f37d2e23985dcfa65662d163fa/raw/2fd47d3ff5e4342ae789c355fccad46accebe256/install_font_adobe_source_code_pro.sh
source install_font_adobe_source_code_pro.sh
rm install_font_adobe_source_code_pro.sh
ln -s ~/.local/share/fonts/adobe-fonts/source-code-pro/ ~/github/source-code-pro

# gnome theme
git clone https://github.com/daniruiz/flat-remix-gnome ~/github/flat-remix-gnome
mkdir -p ~/.themes
cp -r ~/github/flat-remix-gnome/Flat-Remix* ~/.themes
gsettings set org.gnome.shell.extensions.user-theme name "Flat-Remix"

# gnome shell extensions
gnome-shell-extension-tool -e apps-menu@gnome-shell-extensions.gcampax.github.com
gnome-shell-extension-tool -e places-menu@gnome-shell-extensions.gcampax.github.com
gnome-shell-extension-tool -e user-theme@gnome-shell-extensions.gcampax.github.com

# gnome shell extensions (dash to panel)
EXT_NAME=dash-to-panel@jderose9.github.com
EXT_DIR=~/.local/share/gnome-shell/extensions/$EXT_NAME/schemas
git clone https://github.com/home-sweet-gnome/dash-to-panel.git ~/github/dash-to-panel
cd ~/github/dash-to-panel
make install
gsettings --schemadir $EXT_DIR set org.gnome.shell.extensions.dash-to-panel panel-position  'TOP'
gsettings --schemadir $EXT_DIR set org.gnome.shell.extensions.dash-to-panel panel-size      32
gsettings --schemadir $EXT_DIR set org.gnome.shell.extensions.dash-to-panel appicon-margin  0
gsettings --schemadir $EXT_DIR set org.gnome.shell.extensions.dash-to-panel appicon-padding 0
gnome-shell-extension-tool -e dash-to-panel@jderose9.github.com

# desktop icons
gsettings set org.gnome.desktop.background show-desktop-icons true
gsettings set org.gnome.nautilus.desktop home-icon-visible true
gsettings set org.gnome.nautilus.desktop trash-icon-visible true
gsettings set org.gnome.nautilus.desktop volumes-visible true

# Setting -> Language Support
# Setting -> Region & Language -> [+]Japanese(Mozc)
