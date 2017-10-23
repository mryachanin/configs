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


#### Prompt ####
# Figure out the SHORT hostname
if [[ "$OSTYPE" = darwin* ]]; then
    # macOS's $HOST changes with dhcp, etc. Use ComputerName if possible.
    SHORT_HOST=$(scutil --get ComputerName 2>/dev/null) || SHORT_HOST=${HOST/.*/}
else
    SHORT_HOST=${HOST/.*/}
fi

# Outputs current branch info in prompt format
function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS=''
  local FLAGS
  FLAGS=('--porcelain')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi
  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

setopt prompt_subst # Enables additional prompt extentions
autoload -U colors && colors    # Enables colours

PROMPT='%n@$SHORT_HOST %{%F{cyan}%}%c%{%f%} $(git_prompt_info) %# %{$reset_color%}'
#RPROMPT='%(?:%{%F{green}%}-> %{%f%}:%{%F{red}%}-> %{%f%})'
RPROMPT='%F{cyan}%D{%e.%b.%y %H.%M}%f%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

