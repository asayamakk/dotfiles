[ -f ~/dotfiles/functions.sh ] && source ~/dotfiles/functions.sh
[ -f ~/dotfiles/alias.sh.private ] && source ~/dotfiles/alias.sh.private

alias etu='perl -MEncode -nle '\''binmode STDOUT, ":utf8"; print Encode::decode('\''eucjp'\'', $_)'\'''
alias kabe='open /System/Library/CoreServices/ScreenSaverEngine.app'
alias grep='ggrep'
alias apps='sh ~/scripts/startup.sh'
alias g='func_cd_ghq_list'
alias ll="ls -la"
alias amesh='docker run -e TERM_PROGRAM --rm otiai10/amesh'
alias current-branch='git status | head -1 | sed -e "s/On branch //"'
type gsed >/dev/null 2>&1 && alias sed='gsed'


# ctagsをbrewでinstallしていたら
test -L /usr/local/bin/ctags && alias ctags="/usr/local/bin/ctags"

alias netstat-lntp='sudo lsof -nP -iTCP -sTCP:LISTEN'
