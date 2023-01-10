# author: 191101
# email: k.nguyen.an.hoa<at>gmail.com


OS="linux"
ENV_DIR=".env.linux"
if [[ $(uname | grep -i darwin) ]]; then
    OS="darwin"
    ENV_DIR=".env.osx"
fi
source "${HOME}/.bashrc.helpers"; # load in helpers

info "Init .bashrc ($OS)"

while (( "$#" )); do
    case $1 in
        --help | -h)
            info "Source options:"
            echo "--help, -h: print this, halts all other ops"
            echo "--verbose, -v: source loudly"
            echo "--install-optional, -o: install optional pkgs"
            return 0
            ;;
        --verbose | -v)
            VERBOSE=1
            ;;
        --install-optional | -o)
            INSTALL_OPTIONAL=1
            ;;
        *)
            warn "Option $1 not understood, ignored"
    esac
    shift;
done


# {{{ CONFIGS
shopt -s histappend
shopt -s cdspell
stty -ixon

test_and_source .git-completion.bash; # must be first

test_and_source .bashrc.iterm2config;
test_and_source .bashrc.pkgs;
test_and_source .bashrc.optionalpkgs;
test_and_source .bashrc.aliases;
test_and_source .bashrc.aliases.ruby.;
test_and_source .bashrc.aliases.extended;
test_and_source .bashrc.prompt;
test_and_source .bashrc.remoteservices;
# test_and_source .bashrc.borgbackup;

# must source last, overrides default settings for local machine
test_and_source .bashrc.local;
# }}}


# {{{ GLOBAL VARS
VIMWIKI_DIR="${HOME}/id/repos/.vimwiki"
export LSCOLORS=DxGxBxDxCxEgEdxbxgxcxd
export HISTIGNORE="&:history:ls:la:md:exit:[ \t]*"
export HISTCONTROL=ignoredups:erasedups
export EDITOR=vi
export PATH=$PATH # must be last export
unset INSTALL_OPTIONAL VERBOSE
# }}}


if [[ $(which cowsay) ]] && [[ $(which fortune) ]]; then
    fortune | cowsay -f tux
fi
