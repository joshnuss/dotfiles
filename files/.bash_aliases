alias psa='ps -A | grep $1'
alias hgrep='history | grep $1'
alias ss='script/server'
alias sc='script/console'
alias sd='script/dbconsole'
alias sg='script/generate'
alias sp='script/plugin'
alias bubble=notify-send
alias nt='nautilus'
alias gts='git status'
alias gta='git add'
alias gtr='git rm'
alias gtc='git commit'
alias gtch='git checkout'
alias gtb='git branch'
alias gtcm='git commit -m'
alias ack='ack-grep'
alias bx='bundle exec'
alias bo='bundle open'
alias bs='bundle show'
alias killrb='killall -9 ruby'
alias git=hub
alias show='cat `which $1`'
alias vi=vim

alias rs='bx rails server'
alias rc='bx rails console'
alias rg='bx rails generate'

# zeus commands
alias zstart='zeus start'
alias zd='zeus dbconsole'
alias zr='zeus rake'
alias zs='zeus server'
alias zg='zeus generate'
alias zc='zeus console'
alias zrun='zeus runner'
alias zt='zeus test'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias dbm='rake db:migrate'

function ra {
  rails new $1
  cd $1
}

# mkcd some/other/dir
function mkcd {
  mkdir -p $* && cd ${!#}
}

# bye ruby
function bye {
  killall -9 $*
}

# reminder 10:20am "take out the garbage"
function reminder {
  echo -e "aplay ~/sounds/reminder.wav\nnotify-send Reminder '$2'" | at $1
}
