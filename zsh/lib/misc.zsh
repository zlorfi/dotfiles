## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## jobs
setopt long_list_jobs

## pager
export PAGER=less
export LC_CTYPE=$LANG
#export LC_CTYPE=de_DE.UTF-8
