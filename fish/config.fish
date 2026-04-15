function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function p
    # Get the path of the tool(it may differ based on your setup)
    set TOOL_PATH /home/mohannad/Programming/personal/project-manager/index.ts
    # If using a flag, run directly without capturing output
    if string match -q -- '--*' $argv[1]
      # bun /home/mohannad/Programming/personal/project-manager/index.ts $argv
      bun $TOOL_PATH $argv
    else
      # For project navigation, capture output and cd
      set target (bun $TOOL_PATH $argv)
      if test -d "$target"
        cd "$target"
      else
        echo $target
      end
    end
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
alias yazi_config 'nvim ~/.config/yazi'
alias dunst_config 'nvim ~/.config/dunst'
alias picom_config 'nvim ~/.config/picom'
alias polybar_config 'nvim ~/.config/polybar'
alias rofi_config 'nvim ~/.config/rofi'
alias cb="flatpak run app.getclipboard.Clipboard"

alias salasel 'cd ~/Programming/tera-visions/Salaasil/salasel/'
alias marwa 'cd ~/Programming/web/aqua-marwa/'


alias vim 'nvim'

# fastfetch

#bun stuff
# alias bun="$HOME/.bun/bin/bun"
# alias waha-tui="$HOME/.bun/bin/waha-tui"

# SDKMAN paths
set -gx SDKMAN_DIR $HOME/.sdkman
set -gx GRADLE_HOME $SDKMAN_DIR/candidates/gradle/current
set -gx KOTLIN_HOME $SDKMAN_DIR/candidates/kotlin/current
set -gx YAZI_CONFIG_HOME $HOME/.config/yazi
# Add all paths
set -gx PATH $PATH \
    $ANDROID_HOME/cmdline-tools/latest/bin \
    $ANDROID_HOME/platform-tools \
    $ANDROID_HOME/emulator \
    $GRADLE_HOME/bin \
    $KOTLIN_HOME/bin \
    $HOME/.local/bin \
    $HOME/go/bin \
    $HOME/node/bin \
    $HOME/python/bin \
    /usr/local/sbin \
    /usr/local/bin \
    /usr/sbin \
    /usr/bin \
    /sbin \
    /bin \
    $HOME/develop/flutter/bin\
    $HOME/.bun/bin

# OpenClaw Completion
source "/home/mohannad/.openclaw/completions/openclaw.fish"
