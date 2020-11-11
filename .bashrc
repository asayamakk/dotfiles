GIT_PS1_SHOWDIRTYSTATE=true

cecho(){
  RED="\033[0;31m"
  GREEN='\033[0;32m'
  YELLOW='\033[1;33m'
  CYAN='\033[1;36m'
  BLUE='\033[1;34m'
  # ... ADD MORE COLORS
  NC='\033[0m' # No Color

  printf "${!1}${2} ${NC}\n"
}


## プロンプト
__show_status() {
  local result=$?
  if [ $result -eq 0 ] ; then
    echo '🐏'
  elif [ $result -eq 126 ] ; then
    # permision denied
    echo '🙅'
  elif [ $result -eq 127 ] ; then
    # command not found
    echo '👀'
  elif [ $result -eq 130 ] ; then
    # interrupted ctrl-c
    echo '🐱'
  else
    echo '🍣'
  fi
}

__show_k8s_ctx() {
  cecho "BLUE" '['$(kubectl config current-context  | rb "first.split('_').last")']'
}

export PS1='\[\033[33m\][\w]\[\033[32m\]$(__git_ps1)\[\e[0m\] \n$(__show_status) '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
