# .zshrc

# Source global definitions
if [ -f /etc/zshrc ]; then
    . /etc/zshrc
fi

# User specific environment
if [[ ! "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
    PATH="$PATH:/usr/local/go/bin"
    PATH="$PATH:$HOME/bin"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.zshrc.d ]; then
    for rc in ~/.zshrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # funktioniert auch in zsh

# Aliases
alias ..="cd .."
alias la="ls -la"
alias dotfiles="cd ~/.dotfiles"
alias master="cd /home/nico/Nextcloud/Uni/Master"
alias projekte="cd /home/nico/Nextcloud/Projekte"
alias copy='xclip -selection clipboard'

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# JBang
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

# Autocompletion
autoload -Uz compinit && compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Menü-Auswahl bei mehreren Optionen
zstyle ':completion:*' menu select

# Starship prompt
eval "$(starship init zsh)"
