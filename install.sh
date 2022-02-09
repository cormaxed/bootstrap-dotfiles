#!/bin/zsh

DOTFILE_BRANCH=main

# Install plugin managers
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd /tmp
curl https://codeload.github.com/omahoco/dotfiles/zip/refs/heads/${DOTFILE_BRANCH} -o dotfiles.zip
unzip -o dotfiles.zip
rsync -vr dotfiles-${DOTFILE_BRANCH}/.config ~/.config

rm -rf dotfiles.zip dotfiles-${DOTFILE_BRANCH}

nvim --headless +PlugInstall +qall
~/.tmux/plugins/tpm/scripts/install_plugins.sh
