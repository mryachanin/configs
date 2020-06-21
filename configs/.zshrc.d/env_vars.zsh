###############################
#### Environment Variables ####
###############################

# Set default editor to vim.
# Editor is used on terminals without access to a GUI, so it normally does not
# need to be set, but why not set it just in case. Visual is used when a GUI is
# present.
export EDITOR=vim
export VISUAL=$EDITOR

# Set prompt to '[username@hostname:dir]% '
export PROMPT='[%n@%m:%c]%# '

# Enable git integration with right-hand side prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

