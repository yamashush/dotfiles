# init :seed:

```sh
chmod u+x ./install.sh
./install.sh

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.guard.rb ~/.guard.rb
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/fish/ ~/.config/fish
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/skhd/.skhdrc ~/.skhdrc
ln -s ~/dotfiles/yabai/.yabairc ~/.yabairc


brew services start skhd
brew services start yabai
```

