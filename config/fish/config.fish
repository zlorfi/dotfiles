# setting defualt editor
set EDITOR vim

# add brew binaried
fish_add_path /opt/homebrew/opt/postgresql@11/bin
fish_add_path /opt/homebrew/bin

# setting PATH for rbenv
# set PATH /usr/local/var/rbenv/shims $PATH
status --is-interactive; and source (rbenv init -|psub)

# setting elixir sepcific stuff
set ERL_AFLAGS "-kernel shell_history enabled"

# disable homebrew phoning home
set HOMEBREW_NO_ANALYTICS 1

# disable 'spring' for Rails development
set DISABLE_SPRING 1

# setting ulimits
ulimit -n 2048

# grep options
set GREP_OPTIONS '--color=auto'
set GREP_COLOR '1;32'

# setting locale
set -x LC_ALL 'en_US.UTF-8'
set -x LANG 'en_US.UTF-8'

# define GOPATH
set -x -U GOPATH $HOME/Documents/workspace_go

# definde Android SDK
set -x -U ANDROID_SDK_ROOT $HOME/Library/Android/sdk
set -x -U ANDROID_HOME $HOME/Library/Android/sdk
# set -x -U JAVA_HOME /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home
set -x -U JAVA_HOME /Library/Java/JavaVirtualMachines/jdk-11.jdk/Contents/Home/

# setting GPG
set GPG_TTY /dev/ttys001

# set home
set -q XDG_CONFIG_HOME || set -U XDG_CONFIG_HOME $HOME/.config

# set abbveriations
if status --is-interactive
    set -g fish_user_abbreviations
    abbr --add wgo 'cd ~/Documents/workspace_go/src'
    abbr --add wtm 'cd ~/Documents/workspace_tm'
    abbr --add obc 'cd ~/Documents/workspace_tm/obc'
    abbr --add tix 'cd ~/Documents/workspace_tm/amadeus_api/'
    abbr --add gst 'git status'
    abbr --add gd 'git diff'
    abbr --add ga 'git add .'
    abbr --add gl 'git pull'
    abbr --add gup 'git fetch && git rebase'
    abbr --add gp 'git push'
    abbr --add gc 'git commit -v'
    abbr --add gc! 'git commit --amend'
    abbr --add gca 'git commit -v -a'
    abbr --add gco 'git checkout'
    abbr --add gb 'git branch'
    abbr --add gba 'git branch -a'
    abbr --add gcount 'git shortlog -sn'
    abbr --add gcp 'git cherry-pick'
    abbr --add glg 'git log --stat --max-count=5'
    abbr --add bb 'brew update; and brew outdated'
    abbr --add bx 'bundle exec'
    abbr --add bxrc 'bundle exec rails c'
    abbr --add bxrs 'bundle exec rails s'
    abbr --add cloud 'cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
    abbr --add pg_start 'pg_ctl -D /usr/local/var/postgresql@11 start'
    abbr --add pg_stop 'pg_ctl -D /usr/local/var/postgresql@11 stop'
    abbr --add k 'kubectl'
end

# disable login greeting
set fish_greeting ''

# set -g fish_user_paths "/usr/local/opt/node@14/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# add kitty support
# kitty + complete setup fish | source
set -g fish_user_paths "/usr/local/opt/postgresql@11/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/imagemagick@6/bin" $fish_user_paths

