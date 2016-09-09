function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo 'Hg' && return
    echo '»'
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
$(virtualenv_info)$(prompt_char) '
#RPROMPT='[%T]'

#RVM settings
if which rvm-prompt &> /dev/null; then
  RPROMPT='[%T] %{$fg[yellow]%}rvm: %{$reset_color%}%{$fg[red]%}$(ruby_version)%{$reset_color%}'
elif which rbenv &> /dev/null; then
  RPROMPT='[%T] %{$fg[yellow]%}rbenv: %{$reset_color%}%{$fg[red]%}$(ruby_version)%{$reset_color%}'
else
  RPROMPT='[%T]'
fi

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
