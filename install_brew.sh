#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."
brew upgrade


formulas=(
    exa
    fish
    fisher
    fzf
    gitmoji
    heroku
    jira-cli
    jp2a
    jq
    neofetch
    neovim
    nodenv
    peco
    pyenv
    rbenv
    ripgrep
    sl
    speedtest
    tmux

    koekeishiya/formulae/skhd
    koekeishiya/formulae/yabai
)

echo "brew tap"
# brew tap thirdparty
brew tap homebrew/cask-fonts

echo "brew install formula"
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

# install gui up
casks=(
    hammerspoon # https://github.com/Hammerspoon/hammerspoon
)

echo "brew casks"
for cask in "${casks[@]}"; do
    brew install --cask $cask
done


stores=()


echo "app stores"
for store in "${stores[@]}"; do
    mas install $store
done


brew cleanup

echo "brew installed"