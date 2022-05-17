GIT_PS1_SHOWDIRTYSTATE=true

cecho(){
  RED="\033[0;31m"
  GREEN='\033[0;32m'
  YELLOW='\033[1;33m'
  CYAN='\033[1;36m'
  BLUE='\033[1;34m'
  # ... ADD MORE COLORS
  NC='\033[0m' # No Color

  printf "${!1}${2}${NC}\n"
}

__retain_status() {
  echo -n $? > ${HOME}/tmp/last_status_code
}

## プロンプト
__show_status() {
  local last_status_code=$(cat ${HOME}/tmp/last_status_code)
  if [ $last_status_code -eq 0 ] ; then
    echo '🐏'
  elif [ $last_status_code -eq 126 ] ; then
    # permision denied
    echo '🙅'
  elif [ $last_status_code -eq 127 ] ; then
    # command not found
    echo '👀'
  elif [ $last_status_code -eq 130 ] ; then
    # interrupted ctrl-c
    echo '🐱'
  else
    echo '🍣'
  fi
}

__show_k8s_ctx() {
  cecho "BLUE" '['$(kubectl config current-context  | rb "first.split('_').last")']'
}

export PS1='$(__retain_status)\[\033[33m\][\w] $(cecho "CYAN" \t)\[\033[32m\]$(__git_ps1)\[\e[0m\]\n$(__show_status) '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
. "$HOME/.cargo/env"
