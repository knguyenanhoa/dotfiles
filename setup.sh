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
ln -sh ${HOME}/.dotfiles/bash/$ENV_DIR/.bashrc.aliases ${HOME}/$ENV_DIR/.bashrc.aliases
ln -sh ${HOME}/.dotfiles/bash/$ENV_DIR/.bashrc.aliases.extended ${HOME}/$ENV_DIR/.bashrc.aliases.extended
ln -sh ${HOME}/.dotfiles/bash/$ENV_DIR/.bashrc.aliases.ruby. ${HOME}/$ENV_DIR/.bashrc.aliases.ruby.
ln -sh ${HOME}/.dotfiles/bash/$ENV_DIR/.bashrc.optionalpkgs ${HOME}/$ENV_DIR/.bashrc.optionalpkgs
ln -sh ${HOME}/.dotfiles/bash/$ENV_DIR/.bashrc.pkgs ${HOME}/$ENV_DIR/.bashrc.pkgs
ln -sh ${HOME}/.dotfiles/bash/$ENV_DIR/.bashrc.prompt ${HOME}/$ENV_DIR/.bashrc.prompt
ln -sh ${HOME}/.dotfiles/bash/$ENV_DIR/.bashrc.borgbackup ${HOME}/$ENV_DIR/.bashrc.borgbackup
ln -sh ${HOME}/.dotfiles/bash/$ENV_DIR/.bashrc.remoteservices ${HOME}/$ENV_DIR/.bashrc.remoteservices
ln -sh ${HOME}/.dotfiles/bash/.bashrc ${HOME}/.bashrc

ln -sh ${HOME}/.dotfiles/alacritty/.alacritty.yml ${HOME}/.alacritty.yml

ln -sh ${HOME}/.dotfiles/ctags/.ctags ${HOME}/.ctags

ln -sh ${HOME}/.dotfiles/git/.git-completion.bash ${HOME}/.git-completion.bash
ln -sh ${HOME}/.dotfiles/git/.git-message ${HOME}/.git-message
ln -sh ${HOME}/.dotfiles/git/.gitconfig ${HOME}/.gitconfig
ln -sh ${HOME}/.dotfiles/git/.gitignore ${HOME}/.gitignore

ln -sh ${HOME}/.dotfiles/iterm/.iterm2_shell_integration.bash ${HOME}/.iterm2_shell_integration.bash

ln -sh ${HOME}/.dotfiles/ruby/.irbrc ${HOME}/.irbrc
ln -sh ${HOME}/.dotfiles/ruby/.rvmrc ${HOME}/.rvmrc

ln -sh ${HOME}/.dotfiles/tmux/.tmux.conf ${HOME}/.tmux.conf

mkdir -p ${HOME}/.vim
ln -sh ${HOME}/.dotfiles/vim/.vim/colors ${HOME}/.vim/colors
ln -sh ${HOME}/.dotfiles/vim/.vim/ftplugin ${HOME}/.vim/ftplugin
ln -sh ${HOME}/.dotfiles/vim/.vim/syntax ${HOME}/.vim/syntax
ln -sh ${HOME}/.dotfiles/vim/.vimrc ${HOME}/.vimrc

echo "[INFO] Done"
source ${HOME}/.bashrc
