export ZSH=$HOME/.zsh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# rbenv
if which rbenv > /dev/null; then
  export RBENV_ROOT=/usr/local/var/rbenv
  eval "$(rbenv init -)"
fi

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Load and run compinit
autoload -U compinit
compinit -i

#ulimit -Hn 2048
#ulimit -Sn 2048

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=/usr/local/bin:$PATH
PATH=/usr/local/bin:/usr/local/sbin:$PATH # Added for more brew executables
PATH=/opt/chefdk/bin:/opt/chef/bin:$PATH # Added for more brew executables

source `jump-bin --zsh-integration`

# Editor
export EDITOR=vim

# SSL Certificate needed, install first with
# brew install curl-ca-bundle
if [ -f /usr/local/opt/curl-ca-bundle/share/ca-bundle.crt ]; then
  export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
fi
