function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

bind ctrl-h backward-kill-word

# Android SDK
set -gx ANDROID_HOME $HOME/Android/Sdk

# set neovim the default editor
set -gx EDITOR nvim
set -gx VISUAL nvim

alias i3_config 'nvim ~/.config/i3'
alias nvim_config 'nvim ~/.config/nvim'
alias kitty_config 'nvim ~/.config/kitty'
alias fish_config 'nvim ~/.config/fish'
alias dunst_config 'nvim ~/.config/dunst'
alias picom_config 'nvim ~/.config/picom'
alias polybar_config 'nvim ~/.config/polybar'


alias salasel 'cd ~/Programming/tera-visions/Salaasil/salasel/'
alias marwa 'cd ~/Programming/web/aqua-marwa/'

#bun stuff
# alias bun="$HOME/.bun/bin/bun"
# alias waha-tui="$HOME/.bun/bin/waha-tui"

# Add all paths
set -gx PATH $PATH \
    $ANDROID_HOME/cmdline-tools/latest/bin \
    $ANDROID_HOME/platform-tools \
    $ANDROID_HOME/emulator \
    $HOME/.local/bin \
    /usr/local/sbin \
    /usr/local/bin \
    /usr/sbin \
    /usr/bin \
    /sbin \
    /bin \
    $HOME/develop/flutter/bin\
    $HOME/.bun/bin
