#### Path ####
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"


#### Env Vars ####
export CONFIG_DIR=$HOME/Configs


#### Aliases ####
alias l="ls -lhF"
alias ll="l -A"
alias szsh="source $HOME/.zshrc"


#### Functions ####
show_configs() {
    for config_path in $CONFIG_DIR/**/*.zsh
    do
        echo "#### $config_path ####"
        cat $config_path
        echo "\n\n"
    done
}

growl() { echo -e $'\e]9;'${1}'\007' ; return ; }

grok() { grep -rnw $1 -e "$2"; }

set-title() {
    echo -e "\e]0;$*\007"
}

ssh() {
    set-title $*;
    /usr/bin/ssh -2 $*;
    set-title $HOST;
}

