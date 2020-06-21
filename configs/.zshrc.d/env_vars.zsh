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
