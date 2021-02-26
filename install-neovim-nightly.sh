#!/bin/sh
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
mv nvim.appimage nvim
sudo mv nvim /usr/local/bin/
sudo chmod a+x /usr/local/bin/nvim


