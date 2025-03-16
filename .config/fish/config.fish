if status is-interactive
    # Commands to run in interactive sessions can go here
end

#############################################################
# Homebrew
#############################################################
eval "$(/opt/homebrew/bin/brew shellenv)"

#############################################################
# Starship
#############################################################
starship init fish | source

#############################################################
# ASDF
#############################################################
# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims


#############################################################
# fzf
#############################################################
# https://vitormv.github.io/fzf-themes/
set -Ux FZF_DEFAULT_OPTS " \
    --height 70% --tmux top,70% --layout reverse --border top \
    --border=rounded \
    --color=fg:#d0d0d0,bg:-1,hl:#5f87af \
    --color=fg+:#d0d0d0,bg+:#262626,hl+:#5fd7ff \
    --color=info:#afaf87,prompt:#d7005f,pointer:#af5fff \
    --color=marker:#87ff00,spinner:#af5fff,header:#87afaf \
"

set -Ux ENHANCD_FILTER "fzf --height 40%:fzy"

#############################################################
# aliases
#############################################################
# fish
alias c='clear'
# bat
# https://github.com/sharkdp/bat
# https://github.com/sharkdp/bat/blob/master/doc/README-ja.md
set -gx BAT_THEME "GitHub"
alias cat='bat -plain --paging=never -l log'
# eza
alias ls='eza --time-style long-iso'
alias la='ls -al' # eza: Unknown argument -A
# grep 
alias grep='grep --color=auto -i'
# find
alias fi='find ./ -name "*" -type f | xargs grep --color=auto -i'
# git
alias g='git'
alias gb='git branch'
alias gbc='git branch --show-current'
alias gs='git status'
alias gd='git diff'
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

#############################################################
# auto ls
#############################################################
function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and la
    else
        builtin cd ~; and la
    end
end
# auto ls (enhancd hook)
set -gx ENHANCD_HOOK_AFTER_CD la

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

#############################################################
# path
#############################################################
set -gx GOOGLE_APPLICATION_CREDENTIALS $HOME/.config/gcloud/application_default_credentials.json
set -x PATH /opt/homebrew/opt/libpq/bin $PATH

#############################################################
# hack
#############################################################
set -gx TF_CLI_ARGS_plan --parallelism=100
set -gx TF_CLI_ARGS_apply --parallelism=100
