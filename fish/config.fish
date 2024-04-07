if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (/opt/homebrew/bin/brew shellenv)
    eval "$(nodenv init -)"
    eval "$(pyenv init -)"
    status --is-interactive; and source (anyenv init -|psub)

    # prompt
    # https://github.com/starship/starship
    # https://starship.rs/config/
    starship init fish | source
end
