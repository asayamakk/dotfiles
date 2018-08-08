source ~/dotfiles/functions.sh

alias etu='perl -MEncode -nle '\''binmode STDOUT, ":utf8"; print Encode::decode('\''eucjp'\'', $_)'\'''
alias kabe='open /System/Library/CoreServices/ScreenSaverEngine.app'
alias grep='ggrep'
alias apps='sh ~/scripts/startup.sh'
alias g='func_cd_ghq_list'
alias kanban="open  https://sd-redmine.gmo-media.jp/rb/projects/pointtown/taskboard"
alias ll="ls -la"

# ctagsをbrewでinstallしていたら
test -L /usr/local/bin/ctags && alias ctags="/usr/local/bin/ctags"

alias netstat-lntp='sudo lsof -nP -iTCP -sTCP:LISTEN'
