#
# PATH
#
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $HOME/.rbenv/bin $PATH

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
        builtin cd "$argv"; and ls
    else
        builtin cd ~; and ls
    end
end