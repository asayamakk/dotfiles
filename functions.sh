function func_cd_ghq_list () {
  selected=$(ghq list | fzf)
  [ -z $selected ] && change_to=$(pwd) || change_to=$(ghq root)/$selected
  cd $change_to
}
