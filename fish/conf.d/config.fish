#
# PATH
#
#set -x PATH $HOME/.anyenv/bin $PATH
#set -Ux fish_user_paths $HOME/.anyenv/bin $fish_user_paths
set -Ux fish_user_paths $HOME/.rbenv/bin $fish_user_paths
set -x PATH $HOME/.rbenv/shims $PATH
#set -x PATH $HOME/.rbenv/bin $PATH
#set -x PATH $HOME/.nodenv/shims $PATH
#set -x PATH $HOME/.nodenv/bin $PATH
#set -x PATH $HOME/.pyenv/shims $PATH
#set -x PATH /usr/local/opt/mysql@5.7/bin $PATH

#set -x PATH /opt/homebrew/opt/openssl@3/bin: $PATH
#set -gx LDFLAGS “-L/opt/homebrew/opt/openssl@3/lib”
#set -gx CPPFLAGS “-I/opt/homebrew/opt/openssl@3/include”
#set -gx PKG_CONFIG_PATH “/opt/homebrew/opt/openssl@3/lib/pkgconfig”

#set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=/opt/homebrew/opt/openssl@3/bin/openssl"
#set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=/usr/local/opt/openssl@1.1"


#set -x PATH /opt/homebrew/opt/openssl@1.1/bin $PATH
#set -gx LDFLAGS “-L/opt/homebrew/opt/openssl@1.1/lib”
#set -gx CPPFLAGS “-I/opt/homebrew/opt/openssl@1.1/include”
set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=/opt/homebrew/opt/openssl@1.1/"
#set -gx RBENV_ROOT "~/.rbenv"
set -gx RUBY_CFLAGS "-w"
#set -gx LDFLAGS "-L/opt/local/lib"

# rbenv init - fish | source
#anyenv init - fish | source
#eval (rbenv init - fish)

#set -gx PATH '~/.rbenv/shims' $PATH
#set -gx RBENV_SHELL fish

#eval "$(rbenv init -)

# https://docs.brew.sh/Shell-Completion
# if test -d (brew --prefix)"/share/fish/completions"
#     set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
# end

# if test -d (brew --prefix)"/share/fish/vendor_completions.d"
#     set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
# end

# prompt
# https://spacefish.matchai.dev/docs/Options.html

# set -g fish_prompt_pwd_dir_length 0
# set SPACEFISH_PROMPT_DEFAULT_SUFFIX 
# set SPACEFISH_USER_SHOW always
# set SPACEFISH_USER_SUFFIX " ᔦ๑° ꒳ °๑ᔨ "
# set SPACEFISH_USER_SUFFIX " ᔦ๑°ω°๑ᔨ "
# set SPACEFISH_USER_SUFFIX " (´・ω・`) "
# set SPACEFISH_USER_SUFFIX " 🚀 "
set SPACEFISH_TIME_SHOW true
set SPACEFISH_DATE_SHOW true
set SPACEFISH_TIME_PREFIX "⏰ "
set SPACEFISH_PROMPT_FIRST_PREFIX_SHOW true
set SPACEFISH_DIR_PREFIX "🗂  "
set SPACEFISH_GIT_PREFIX "🌳 "

# bat
# https://github.com/sharkdp/bat
# https://github.com/sharkdp/bat/blob/master/doc/README-ja.md
set -gx BAT_THEME "Dracula"
alias bl='bat -plain --paging=never -l log'
alias bln='bat -plain --style=numbers --paging=never -l log'

# heroku
alias hl='heroku local -e env | bln'
alias tl='tail -f -20 log/development.log | bl'

# peco 
# https://github.com/oh-my-fish/plugin-peco
function fish_user_key_bindings
    bind \cr 'peco_select_history (commandline -b)'
    # bind \cr '__fzf_reverse_isearch'
    bind \co '__fzf_open --editor'
    bind \cg '__fzf_open'
end 

# fzf
# https://github.com/jethrokuan/fzf 

# bind \co '__fzf_open --editor'
# bind -M insert "ç" fzf-cd-widget
# set -U FZF_LEGACY_KEYBINDINGS 0
# set -U FZF_DISABLE_KEYBINDINGS 0
# set -U FZF_PREVIEW_FILE_CMD "head -n 30"
# set -U FZF_PREVIEW_DIR_CMD "la"
# 配下のファイルを絞り込みエディタで表示する
# bind \cp "__fzf_open --editor --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# 履歴からコマンドを絞り込み実行する
# bind \cr __fzf_reverse_isearch
# alt+cで配下のディレクトを絞り込み移動する
# bind \ec __fzf_cd

# set -x FZF_DEFAULT_OPTS '
#     --cycle
#     --border
#     --height=90%
#     --layout=reverse 
#     --marker="!"
#     --color=fg:#bdae93,bg:#32302f,hl:#83a598
#     --color=fg+:#ebdbb2,bg+:#3c3836,hl+:#83a598
#     --color=info:#fabd2f,prompt:#fabd2f,pointer:#8ec07c
#     --color=marker:#8ec07c,spinner:#8ec07c,header:#83a598
# '

set -x FZF_DEFAULT_OPTS '
    --border
'
alias vs="code (fzf \
    --cycle \
    --height=90% \
    --color=info:#fabd2f,prompt:#fabd2f,pointer:#8ec07c \
    --color=marker:#8ec07c,spinner:#8ec07c,header:#83a598 \
    --preview-window=right:60%:wrap \
    --preview 'bat --style=numbers,changes,header --color=always --line-range :500 {}' \
)"
alias gdd="git status -s \
    | fzf --no-sort --reverse \
        --preview 'git diff --color=always {+2} | diff-so-fancy'  \
        --bind=ctrl-j:preview-down --bind=ctrl-k:preview-up \
        --cycle \
        --height=90% \
        --color=info:#fabd2f,prompt:#fabd2f,pointer:#8ec07c \
        --color=marker:#8ec07c,spinner:#8ec07c,header:#83a598 \
        --preview-window=right:70%:wrap"
set -x FORGIT_FZF_DEFAULT_OPTS "
    --exact \
    --cycle \
    --reverse \
    --height '90%' \
    --color=info:#fabd2f,prompt:#fabd2f,pointer:#8ec07c \
    --color=marker:#8ec07c,spinner:#8ec07c,header:#83a598
"

alias vv="fzf \
    --cycle \
    --height=90% \
    --color=info:#fabd2f,prompt:#fabd2f,pointer:#8ec07c \
    --color=marker:#8ec07c,spinner:#8ec07c,header:#83a598 \
    --preview-window=right:60%:wrap \
    --preview 'bat --style=numbers,changes,header --color=always --line-range :500 {}' \
    || code 
"

# git
alias g='git'
alias gb='git branch'
alias gs='git status'
# alias gd='git diff'
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
alias gchm='git checkout main'
alias gm='git merge'
alias gmum='git merge upstream/main'

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

# auto ls (enhancd hook)
set -gx ENHANCD_HOOK_AFTER_CD la

#
# alias grep 
#
alias grep='grep --color=auto -i'
alias fi='find ./app -name "*" -type f | xargs grep --color=auto -i'

function fish_greeting  
    # https://github.com/cslarsen/jp2a
    jp2a (random choice /Users/yamashu/Dropbox/AA/**.**)
end

function load
  exec fish
end
