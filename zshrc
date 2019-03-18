
# added by booraik
# theme
ZSH_THEME="random"
# command line mode to vi
set -o vi
# enable reverse search in vi command line mode
bindkey '^R' history-incremental-search-backward

# alias for convenience. custom alias has "_" suffix
alias grep_='grep --color=always'
alias netstat_='netstat -nlp | grep -v ^unix'
alias du_='du -hs * | sort -h'
alias ls_='ls -lrtha'

# No share history
setopt noincappendhistory
setopt nosharehistory
