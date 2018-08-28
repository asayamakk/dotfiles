GIT_PS1_SHOWDIRTYSTATE=true


## プロンプト
__show_status() {
  local result=$?
  if [ $result -eq 0 ] ; then
    echo '🐏'
  # elif [ $result -eq 1 ] ; then
  #   # new line with ctrl-c
  #   echo '🍰'
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

export PS1='\[\033[33m\][\w]\[\033[32m\]$(__git_ps1)\[\e[0m\] \n$(__show_status) '
