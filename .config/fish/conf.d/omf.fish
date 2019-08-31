# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# set -g fish_prompt_pwd_dir_length 5

# 
# highlighting colors
# 
# (doc) https://fishshell.com/docs/current/index.html#variables-color
# (default) https://github.com/fish-shell/fish-shell/blob/82052a6cc9fa797070d8945130d45226d5cbc1c5/share/functions/__fish_config_interactive.fish

# OMP Agnoster 


# OMP bobthefish 
# set -g theme_color_scheme terminal
