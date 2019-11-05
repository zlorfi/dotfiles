function _git_branch_name
  echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (git status -s --ignore-submodules=dirty ^/dev/null)
end

function _rb_prompt
  echo (rbenv version | awk '{print $1}')
end

function _kb_context
  kubectl config current-context 2> /dev/null
  if [ (test $status -eq 0) ]
    echo (kubectl config current-context | awk '{print $1}')
  end
end

function fish_prompt
  set -l cyan (set_color -o cyan)
  set -l magenta (set_color -o magenta)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)

  set -l arrow "$magenta↪ $normal"
  # set -l arrow "$red↪ $normal"
  set -l cwd $cyan(pwd|sed "s=$HOME=~=")

  if [ (_kb_context) ]
    set -l kb_context $yellow(_kb_context)
    set kube_context "|$kb_context"
  end

  set -l ruby_version $magenta(_rb_prompt)
  set -l ruby_version "[$ruby_version$normal$kube_context$normal] in "

  if [ (_git_branch_name) ]
    set -l git_branch $red(_git_branch_name)
    set git_info "$normal on $blue$git_branch$blue"

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end

  echo -s $ruby_version $cwd $git_info $normal \n $arrow " "
end

