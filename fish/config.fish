# setting defualt editor
set -U EDITOR vim

# setting PATH for rbenv
set PATH /usr/local/var/rbenv/shims $PATH
# status --is-interactive; and source (rbenv init -|psub)

# setting elixir sepcific stuff
set ERL_AFLAGS "-kernel shell_history enabled"

# disable homebrew phoning home
set HOMEBREW_NO_ANALYTICS 1

# disable 'spring' for Rails development
set DISABLE_SPRING 1

# setting ulimits
ulimit -n 2048

# set abbveriations
if status --is-interactive
    set -g fish_user_abbreviations
    abbr --add wtm 'cd ~/Documents/workspace_tm'
    abbr --add gst 'git status'
    abbr --add gst 'git status'
    abbr --add gst 'git status'
    abbr --add gst 'git status'
    abbr --add gst 'git status'
    abbr --add ga 'git add .'
    abbr --add gl 'git pull'
    abbr --add gup 'git fetch && git rebase'
    abbr --add gp 'git push'
    abbr --add gc 'git commit -v'
    abbr --add gca 'git commit -v -a'
    abbr --add gco 'git checkout'
    abbr --add gb 'git branch'
    abbr --add gba 'git branch -a'
    abbr --add gcount 'git shortlog -sn'
    abbr --add gcp 'git cherry-pick'
    abbr --add glg 'git log --stat --max-count=5'
    abbr --add bb 'brew update; and brew outdated'
    abbr --add bx 'bundle exec'
    abbr --add cloud 'cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
end

# disable login greeting
set fish_greeting ''
