function _func_cd_ghq_list () {
  selected=$(ghq list | fzf)
  [ -z $selected ] && change_to=$(pwd) || change_to=$(ghq root)/$selected
  cd $change_to
}

function gwt() {
  while getopts b opt; do
    case $opt in
      b)  declare NEW_BRANCH=1 ;;
    esac
  done


  GIT_CDUP_DIR=`git rev-parse --show-cdup`
  if [[ $NEW_BRANCH = 1 ]]; then
  git worktree add ${GIT_CDUP_DIR}git-worktrees/$1 -b $1
  else
  branch=$(git branch | fzf | sed -e 's/^ *//g')
  git worktree add ${GIT_CDUP_DIR}git-worktrees/$branch $branch
  fi
}

[ -f ~/dotfiles/alias.sh.private ] && source ~/dotfiles/alias.sh.private

alias etu='perl -MEncode -nle '\''binmode STDOUT, ":utf8"; print Encode::decode('\''eucjp'\'', $_)'\'''
alias apps='sh ~/scripts/startup.sh'
alias g='_func_cd_ghq_list'
alias ll="ls -la"
alias amesh='docker run -e TERM_PROGRAM --rm otiai10/amesh'
alias current-branch='git status | head -1 | sed -e "s/On branch //"'

# ctagsをbrewでinstallしていたら
test -L /usr/local/bin/ctags && alias ctags="/usr/local/bin/ctags"

alias netstat-lntp='sudo lsof -nP -iTCP -sTCP:LISTEN'
