# Source configs
for rc in $HOME/.zshrc.d/* $HOME/.zshrc_local.d/*
do
    echo sourcing: $rc
    . $rc
done

# Enable auto-completion
autoload -Uz compinit
compinit

