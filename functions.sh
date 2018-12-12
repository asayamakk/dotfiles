function func_cd_ghq_list () {
  selected=$(ghq list | fzf)
  [ -z $selected ] && change_to=$(pwd) || change_to=$(ghq root)/$selected
  cd $change_to
}

function gwt() {
  GIT_CDUP_DIR=`git rev-parse --show-cdup`
  git worktree add ${GIT_CDUP_DIR}git-worktrees/$1 -b $1
}
