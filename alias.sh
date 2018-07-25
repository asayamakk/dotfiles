source ~/dotfiles/funcions.sh

alias etu='perl -MEncode -nle '\''binmode STDOUT, ":utf8"; print Encode::decode('\''eucjp'\'', $_)'\'''
alias kabe='open /System/Library/CoreServices/ScreenSaverEngine.app'
alias grep='ggrep'
alias apps='sh ~/scripts/startup.sh'
alias g='cd $(ghq root)/$(ghq list | peco)'
alias b='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias v='vim $(ghq root)/$(ghq list | peco)'
alias kanban="open  https://sd-redmine.gmo-media.jp/rb/projects/pointtown/taskboard"
alias ll="ls -la"
alias netstat-lntp='sudo lsof -nP -iTCP -sTCP:LISTEN'
