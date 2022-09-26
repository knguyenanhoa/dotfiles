#! bin/bash

OS="linux"
ENV_DIR=".env.linux"
if [[ $(uname | grep -i darwin) ]]; then
    OS="darwin"
    ENV_DIR=".env.osx"
fi

echo "[INFO] Symlinking $OS"

mkdir -p ${HOME}/$ENV_DIR
echo "- manually create .bashrc.local as required"
ln -s ${HOME}/.dotfiles/bash/$ENV_DIR/.bashrc.aliases ${HOME}/$ENV_DIR/.bashrc.aliases
ln -s ${HOME}/.dotfiles/bash/$ENV_DIR/.bashrc.aliases.extended ${HOME}/$ENV_DIR/.bashrc.aliases.extended
ln -s ${HOME}/.dotfiles/bash/$ENV_DIR/.bashrc.optionalpkgs ${HOME}/$ENV_DIR/.bashrc.optionalpkgs
ln -s ${HOME}/.dotfiles/bash/$ENV_DIR/.bashrc.pkgs ${HOME}/$ENV_DIR/.bashrc.pkgs
ln -s ${HOME}/.dotfiles/bash/$ENV_DIR/.bashrc.prompt ${HOME}/$ENV_DIR/.bashrc.prompt
ln -s ${HOME}/.dotfiles/bash/$ENV_DIR/.bashrc.borgbackup ${HOME}/$ENV_DIR/.bashrc.borgbackup
ln -s ${HOME}/.dotfiles/bash/$ENV_DIR/.bashrc.remoteservices ${HOME}/$ENV_DIR/.bashrc.remoteservices
ln -s ${HOME}/.dotfiles/bash/.bashrc ${HOME}/.bashrc

ln -s ${HOME}/.dotfiles/alacritty/.alacritty.yml ${HOME}/.alacritty.yml

ln -s ${HOME}/.dotfiles/ctags/.ctags ${HOME}/.ctags

ln -s ${HOME}/.dotfiles/git/.git-completion.bash ${HOME}/.git-completion.bash
ln -s ${HOME}/.dotfiles/git/.git-message ${HOME}/.git-message
ln -s ${HOME}/.dotfiles/git/.gitconfig ${HOME}/.gitconfig
ln -s ${HOME}/.dotfiles/git/.gitignore ${HOME}/.gitignore

ln -s ${HOME}/.dotfiles/iterm/.iterm2_shell_integration.bash ${HOME}/.iterm2_shell_integration.bash

ln -s ${HOME}/.dotfiles/ruby/.irbrc ${HOME}/.irbrc
ln -s ${HOME}/.dotfiles/ruby/.rvmrc ${HOME}/.rvmrc

ln -s ${HOME}/.dotfiles/tmux/.tmux.conf ${HOME}/.tmux.conf

mkdir -p ${HOME}/.vim
ln -s ${HOME}/.dotfiles/vim/.vim/colors ${HOME}/.vim/colors
ln -s ${HOME}/.dotfiles/vim/.vim/ftplugin ${HOME}/.vim/ftplugin
ln -s ${HOME}/.dotfiles/vim/.vim/syntax ${HOME}/.vim/syntax
ln -s ${HOME}/.dotfiles/vim/.vimrc ${HOME}/.vimrc

echo "[INFO] Done"
source ${HOME}/.bashrc
