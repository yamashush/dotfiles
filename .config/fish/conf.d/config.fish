#
# PATH
#
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.nodenv/shims $PATH
set -x PATH $HOME/.nodenv/bin $PATH
set -x PATH $HOME/.pyenv/shims $PATH

#
# prompt
#
set -g fish_prompt_pwd_dir_length 0

#
# plugin-peco https://github.com/oh-my-fish/plugin-peco
#
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

#
# alias git
#
alias g='git'
alias gb='git branch'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias ga='git add'
alias ga.='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gp='git push'
alias gpo='git push origin'
alias gfo='git fetch origin'
alias gfu='git fetch upstream'
alias gl='git log'
alias glo='git log --oneline'
alias gsp='git stash pop'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gchm='git checkout master'
alias gm='git merge'
alias gmum='git merge upstream/master'

#
# auto ls
#
function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and la
    else
        builtin cd ~; and la
    end
end