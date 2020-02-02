set default_user "samet"
set default_machine "Samets-MacBook-Pro"

source ~/.config/fish/aliases.fish
source ~/.config/fish/.iterm2_shell_integration.fish

export GOPATH=$HOME/.go/
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVM_DIR=~/.nvm
export GPG_TTY=(tty)
export PATH="$HOME/.cargo/bin:$PATH"
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'

function make_completion --argument-names alias command
    echo "
    function __alias_completion_$alias
        set -l cmd (commandline -o)
        set -e cmd[1]
        complete -C\"$command \$cmd\"
    end
    " | .
    complete -c $alias -a "(__alias_completion_$alias)"
end

make_completion g 'git'

# highlighting inside manpages and elsewhere
set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -gx LESS_TERMCAP_me \e'[0m'           # end mode
set -gx LESS_TERMCAP_se \e'[0m'           # end standout-mode
set -gx LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

status --is-interactive; and source (jump shell fish | psub)
direnv hook fish | source

function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent
set -gx VOLTA_HOME "/Users/sametaylak/.volta"
string match -r ".volta" "$PATH" > /dev/null; or set -gx PATH "$VOLTA_HOME/bin" $PATH
