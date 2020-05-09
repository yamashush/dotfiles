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
# auto ls
#
function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and la
    else
        builtin cd ~; and la
    end
end