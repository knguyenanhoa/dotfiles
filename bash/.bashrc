# author: 191101
# email: k.nguyen.an.hoa<at>gmail.com

export NOCOLOR="\e[m"
export RED="\033[31m"
export GREEN="\033[32m"
export BLUE="\033[34m"
export CYAN="\033[36m"
export YELLOW="\033[33m"

info() { printf "${GREEN}%s${NOCOLOR} %s %s\n" "[INFO]" "$(date +%H:%M) --" "$*" >&2; }
warn() { printf "${YELLOW}%s${NOCOLOR} %s %s\n" "[WARN]" "$(date +%H:%M) --" "$*" >&2; }
error() { printf "${RED}%s${NOCOLOR} %s %s\n" "[ERROR]" "$(date +%H:%M) --" "$*" >&2; }

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



OS="linux"
ENV_DIR=".env.linux"
if [[ $(uname | grep -i darwin) ]]; then
    OS="darwin"
    ENV_DIR=".env.osx"
fi

info "Init .bashrc ($OS)"

EDITOR=vim
DEFAULT_PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

if [[ -e "${HOME}/.iterm2_shell_integration.bash" ]]; then
    source "${HOME}/.iterm2_shell_integration.bash"
fi

shopt -s histappend
shopt -s cdspell
stty -ixon

export LSCOLORS=DxGxBxDxCxEgEdxbxgxcxd
export HISTIGNORE="&:history:ls:la:md:exit:[ \t]*"
export HISTCONTROL=ignoredups:erasedups


# >>>>>> CONFIGS

function test_and_source {
    if [[ -e "${HOME}/$ENV_DIR/$1" ]]; then
        source "${HOME}/$ENV_DIR/$1";
        return 0;
    fi
    [[ -e "${HOME}/$1" ]] && source "${HOME}/$1" && return 0;
    warn "$1 not found";
}

test_and_source .git-completion.bash; # must be first

test_and_source .bashrc.pkgs;
test_and_source .bashrc.optionalpkgs;
test_and_source .bashrc.aliases;
test_and_source .bashrc.aliases.ruby.;
test_and_source .bashrc.aliases.extended;
test_and_source .bashrc.prompt;
test_and_source .bashrc.remoteservices;
test_and_source .bashrc.borgbackup;

# must source last, overrides default settings for local machine
test_and_source .bashrc.local;

# >>>>>> END CONFIGS


unset INSTALL_OPTIONAL VERBOSE
VIMWIKI_DIR="${HOME}/id/repos/.vimwiki"
export PATH=$PATH
if [[ $(which cowsay) ]] && [[ $(which fortune) ]]; then
    fortune | cowsay -f tux
fi
