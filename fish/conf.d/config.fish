# PATH
set -Ux fish_user_paths $HOME/.rbenv/bin $fish_user_paths
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $HOME/.nodenv/shims $PATH

# Ruby
set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=/opt/homebrew/opt/openssl@1.1/"
set -gx RUBY_CFLAGS "-w"

# prompt
# https://github.com/starship/starship
# https://starship.rs/config/
starship init fish | source

# TODO: old prompt migration
# https://spacefish.matchai.dev/docs/Options.html
# set SPACEFISH_TIME_SHOW true
# set SPACEFISH_DATE_SHOW true
# set SPACEFISH_TIME_PREFIX "⏰ "
# set SPACEFISH_PROMPT_FIRST_PREFIX_SHOW true
# set SPACEFISH_DIR_PREFIX "🗂  "
# set SPACEFISH_GIT_PREFIX "🌱 "

# bat
# https://github.com/sharkdp/bat
# https://github.com/sharkdp/bat/blob/master/doc/README-ja.md
set -gx BAT_THEME "Dracula"
alias cat='bat'
alias bl='bat -plain --paging=never -l log'
alias bln='bat -plain --style=numbers --paging=never -l log'

# exa
# https://github.com/ogham/exa
alias ls='exa --time-style long-iso'
alias la='ls -al' # exa: Unknown argument -A

# heroku
alias hl='heroku local -e .env | bl'
alias tl='tail -f -20 log/development.log | bl'

# jira
# https://github.com/ankitpokhrel/jira-cli
alias jira_sprint_me='jira sprint list --current -a$(jira me) -s~Done'
alias jira_sprint_me_all='jira sprint list --current -a$(jira me)'
alias jira_sprint='jira sprint list --current -s~Done --order-by assignee'
alias jira_sprint_all='jira sprint list --current --order-by assignee'

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
alias gbc='git branch --show-current'
alias gs='git status'
# alias gd='git diff'
alias gds='git diff --staged'
alias gdmc='gd main (gbc)'
alias ga='git add'
alias ga.='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gp='git push'
alias gpo='git push origin'
alias gpoc='git push origin (gbc)'
alias gfo='git fetch origin'
alias gfu='git fetch upstream'
alias gl='git log'
alias glo='git log --oneline'
alias gsp='git stash pop'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gchm='git checkout main'
alias gpum='gchm; git pull upstream main; gpo main'
alias gm='git merge'
alias gmum='git merge upstream/main'
alias gt='git log --all --graph --decorate --oneline'
alias gtt='git log --all --graph --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"'

# auto ls
function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and la
    else
        builtin cd ~; and la
    end
end

# auto ls (enhancd hook)
set -gx ENHANCD_HOOK_AFTER_CD la

# alias grep 
alias grep='grep --color=auto -i'
alias fi='find ./app -name "*" -type f | xargs grep --color=auto -i'

# show AA
# function fish_greeting
#     # https://github.com/cslarsen/jp2a
#     jp2a (random choice /Users/yamashu/Dropbox/AA/**.**)
# end

function fish_load
    exec fish
end
