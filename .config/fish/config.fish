if status is-interactive
    set -g fish_greeting
end

# Aliases
alias syu='sudo pacman -Syu'
alias yaysyu='yay -Syu --aur'
alias clean='paccache -rk0 -v'
alias orphans='pacman -Qtdq | sudo pacman -Rns -'
alias ls='ls -la --color=auto'
alias grep='grep --color=auto'
alias fetch='fastfetch'

# Starship prompt
starship init fish | source

#  Autostart Hyprland at login
 if test -z "$DISPLAY"; and test "$XDG_VTNR" = 1
   exec hyprland
 end

 # Paths
 fish_add_path ~/.local/bin

 # Pywal16
 cat ~/.cache/wal/sequences
