# ────────────── ⚡ Powerlevel10k Instant Prompt ──────────────
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ────────────── 🍺 Homebrew (macOS) ──────────────
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ────────────── 🥶 Zinit (plugin manager) ──────────────
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
   mkdir -p "$(dirname "$ZINIT_HOME")"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# ────────────── 📦 Plugins and Snippets ──────────────
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Oh-My-Zsh plugin snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
#zinit snippet OMZP::sudo
#zinit snippet OMZP::archlinux
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
zinit snippet OMZP::azure
zinit snippet OMZP::rbenv

autoload -Uz compinit && compinit
zinit cdreplay -q

# ────────────── 🛠 Custom Functions ──────────────

# Azure AKS login helper
function aks-login() {
    local selection
    selection=$(
        az aks list --query "[].{name:name,rg:resourceGroup}" -o tsv | \
        awk '{print $2 " / " $1}' | \
        fzf --prompt="Select AKS cluster: "
    )
    if [[ -n "$selection" ]]; then
        local rg="${selection%% / *}"
        local cluster="${selection##*/ }"
        echo "⎈ Logging into AKS cluster: $cluster (RG: $rg)"
        az aks get-credentials --resource-group "$rg" --name "$cluster" --overwrite-existing
    else
        echo "❌ No AKS cluster selected."
    fi
}

# Kubectl context switcher
function kc() {
    case "$1" in
        dev)  kubectl config use-context tm-dev-aks-02 ;;
        int)  kubectl config use-context tm-int-aks-02 ;;
        prod) kubectl config use-context tm-prd-aks-02 ;;
        play) kubectl config use-context tm-plg-aks-01 ;;
        *)    kubectl config use-context futurama ;;
    esac
}

# Neovim shortcut
function n() {
    if command -v nvim >/dev/null 2>&1; then
        nvim "$@"
    else
        echo "❌ Neovim (nvim) not found in PATH" >&2
        return 1
    fi
}

# Powerlevel10k AKS segment
function prompt_aks_cluster() {
  local context color
  context=$(kubectl config current-context 2>/dev/null) || return
  case "$context" in
    *dev*)  color=green ;;
    *int*)  color=yellow ;;
    *prd*|*prod*) color=red ;;
    *)      color=blue ;;
  esac
  print -P "%F{$color}\u2388 AKS:%f $context"
}

# ────────────── 🔑 Aliases ──────────────
# Only set aliases in interactive shells
if [[ $- == *i* ]]; then
  # Directory shortcuts
  alias wgo='cd ~/Documents/workspace_go/src'
  alias wtm='cd ~/Documents/workspace_tm'
  alias wp='cd ~/Documents/workspace_private'
  alias obc='cd ~/Documents/workspace_tm/obc'
  alias cloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'

  # Git shortcuts
  alias gst='git status'
  alias gd='git diff'
  alias ga='git add .'
  alias gl='git pull'
  alias gup='git fetch && git rebase'
  alias gp='git push'
  alias gc='git commit -v'
  alias gc\!='git commit --amend'
  alias gca='git commit -v -a'
  alias gco='git checkout'
  alias gb='git branch'
  alias gba='git branch -a'
  alias gcount='git shortlog -sn'
  alias gcp='git cherry-pick'
  alias glg='git log --stat --max-count=5'
  alias lg='lazygit'

  # Misc
  alias bb='brew update && brew outdated'
  alias bx='bundle exec'
  alias bxrc='bundle exec rails c'
  alias bxrs='bundle exec rails s'
  alias pg_start='pg_ctl -D /usr/local/var/postgresql@11 start'
  alias pg_stop='pg_ctl -D /usr/local/var/postgresql@11 stop'
  alias k='kubectl'
  alias ll='ls --color -la'
  alias vim='nvim'
  alias c='clear'
  alias ff='fzf --preview="bat --color=always {}"'
  alias fabric='fabric-ai'
fi


# ────────────── 🎹 Keybindings ──────────────
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# ────────────── 📜 History ──────────────
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ────────────── ✨ Completion Styling ──────────────
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ────────────── 🧠 Shell Integrations ──────────────
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
# eval "$(oh-my-posh init zsh --config $HOME/.config/oh_my_posh/zen.toml)"

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/michi/.lmstudio/bin"
# End of LM Studio CLI section

export PICO_SDK_PATH=~/pico-sdk
export GPG_TTY=$(tty)
export EDITOR=nvim
# export VISUAL=Neovim
export PATH="/opt/homebrew/bin:$PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/michi/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions


# Load Angular CLI autocompletion.
source <(ng completion script)

# bun completions
[ -s "/Users/michi/.bun/_bun" ] && source "/Users/michi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opencode
export PATH=/Users/michi/.opencode/bin:$PATH

# Added by `rbenv init` on Mon Feb  9 15:10:39 CET 2026
eval "$(rbenv init - --no-rehash zsh)"
export PATH="$HOME/.local/bin:$PATH"

# load secrets from .zsh_secrets
[[ -f ~/.zsh_secrets ]] && source ~/.zsh_secrets
