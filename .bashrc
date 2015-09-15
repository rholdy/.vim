##
# Git shell prompt
##
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
function parse_git_dirty {
  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*"
}

# Set brew bin to PATH so it is checked before /usr/bin
#export PATH=/usr/local/bin:$PATH

##
# Shell colors
##
BLACK="\[\e[0;30m\]"  BOLD_BLACK="\[\e[1;30m\]"  UNDER_BLACK="\[\e[4;30m\]"
RED="\[\e[0;31m\]"    BOLD_RED="\[\e[1;31m\]"    UNDER_RED="\[\e[4;31m\]"
GREEN="\[\e[0;32m\]"  BOLD_GREEN="\[\e[1;32m\]"  UNDER_GREEN="\[\e[4;32m\]"
YELLOW="\[\e[0;33m\]" BOLD_YELLOW="\[\e[1;33m\]" UNDER_YELLOW="\[\e[4;33m\]"
BLUE="\[\e[0;34m\]"   BOLD_BLUE="\[\e[1;34m\]"   UNDER_BLUE="\[\e[4;34m\]"
PURPLE="\[\e[0;35m\]" BOLD_PURPLE="\[\e[1;35m\]" UNDER_PURPLE="\[\e[4;35m\]"
CYAN="\[\e[0;36m\]"   BOLD_CYAN="\[\e[1;36m\]"   UNDER_CYAN="\[\e[4;36m\]"
WHITE="\[\e[0;37m\]"  BOLD_WHITE="\[\e[1;37m\]"  UNDER_WHITE="\[\e[4;37m\]"
NO_COLOR="\[\e[0m\]"

# set some colors for the terminal
export CLICOLOR='true'

# Ask to delete single file
alias rm='rm -i'

PS1="${YELLOW}\h${WHITE} [${GREEN}\W${WHITE}]${WHITE}[${CYAN}\$(parse_git_branch)${RED}\$(parse_git_dirty)${WHITE}]\$${NO_COLOR} "

# see man ls
# The default is "exfxcxdxbxegedabagacad", i.e. blue foreground and default
# background for regular directories, black foreground and red background
# for setuid executables, etc.
export LSCOLORS="gxfxcxdxbxegedabagacad"

####################################
## Navigation Aliases
####################################
alias ls='ls -G'
alias ll='ls -lahF'
alias l='ls -l'
alias v='vim'
alias cd..='cd ..'
alias tlog="tail -f log/development.log"

alias gs='git status'
alias ga='git add --all'
alias gp='git push'
alias gca='git commit --amend'
alias pull='git pull && bundle && rake db:migrate && bin/restart && sidekiq_restart'

alias sidekiq_restart='launchctl unload ~/Library/LaunchAgents/mc-jobs-1.plist && launchctl load ~/Library/LaunchAgents/mc-jobs-1.plist'
alias run_tests='COVERAGE=true rspec -f doc --exclude-pattern "**/selenium/**/*_spec.rb"'
alias db='mycli mask -u root'

alias mc="cd ~/masteryconnect"
alias mmm="cd ~/marketing_site/middleman_marketing"
####################################
## show my IP address
####################################
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2 | tail -n1"
alias myips="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"
alias myextip="dig +short myip.opendns.com @resolver1.opendns.com"

# Git tab completion
source ~/git-completion.bash

# Show/hide hidden files
alias show_hidden='defaults write com.apple.finder AppleShowAllFiles -boolean true && killall Finder'
alias hide_hidden='defaults delete com.apple.finder AppleShowAllFiles && killall Finder'

export EDITOR="vim --wait"

####################################
## functions
####################################
greps () {
  grep -iRan $1 $2 | less -R
}

export RUBY_VERSION='ruby -v'


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
