[ -f ~/dotfiles/alias.sh ] && . ~/dotfiles/alias.sh

export EDITOR=vim
export LESS='-R'
# export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

export HISTTIMEFORMAT='%Y-%m-%dT%T%z '
export HISTSIZE=50000
export XDG_CONFIG_HOME=~/.config
# export DISABLE_SPRING=1
export BASH_SILENCE_DEPRECATION_WARNING=1

export FIGNORE=$FIGNORE:DS_Store

export PATH=$HOME/src/google-cloud-sdk/bin:$PATH
export PATH=$HOME/src/flutter/bin:$PATH

# bash-completion
[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion
[ -f ~/.bashrc ] && source ~/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
if hash rbenv nodenv goenv jenv 2>/dev/null; then
  eval "$(rbenv init -)"
  eval "$(nodenv init -)"
  eval "$(goenv init -)"
  export PATH="$GOROOT/bin:$PATH"
  export PATH="$PATH:$GOPATH/bin"
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

if hash hub 2>/dev/null; then
  eval "$(hub alias -s)"
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$HOME/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/usr200557/sdk/google-cloud-sdk/path.bash.inc' ]; then . '/Users/usr200557/sdk/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/usr200557/sdk/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/usr200557/sdk/google-cloud-sdk/completion.bash.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/usr200557/.sdkman"
[[ -s "/Users/usr200557/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/usr200557/.sdkman/bin/sdkman-init.sh"
