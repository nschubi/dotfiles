# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
# Zinit
# =============================================================================
source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"

# =============================================================================
# Prompt — Powerlevel10k
# =============================================================================
zinit ice depth=1
zinit light romkatv/powerlevel10k
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# =============================================================================
# Plugins
# =============================================================================
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

# =============================================================================
# Completion
# =============================================================================
autoload -Uz compinit && compinit
zinit cdreplay -q

# =============================================================================
# PATH
# =============================================================================
typeset -U PATH  # deduplicate PATH entries
path=(
    "$HOME/.local/bin"
    "$HOME/bin"
    "$HOME/.jbang/bin"
    "/usr/local/go/bin"
    $path
)
export PATH

# =============================================================================
# NVM (lazy-loaded for fast startup)
# =============================================================================
export NVM_DIR="$HOME/.nvm"
zinit ice wait lucid
zinit snippet /dev/null
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    nvm() {
        unfunction nvm node npm npx 2>/dev/null
        source "$NVM_DIR/nvm.sh"
        source "$NVM_DIR/bash_completion" 2>/dev/null
        nvm "$@"
    }
    node() { nvm --version >/dev/null 2>&1; unfunction node 2>/dev/null; command node "$@"; }
    npm()  { nvm --version >/dev/null 2>&1; unfunction npm  2>/dev/null; command npm  "$@"; }
    npx()  { nvm --version >/dev/null 2>&1; unfunction npx  2>/dev/null; command npx  "$@"; }
fi

# =============================================================================
# History
# =============================================================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history hist_ignore_dups hist_ignore_space hist_reduce_blanks

# =============================================================================
# Modular config (optional)
# =============================================================================
if [[ -d ~/.zshrc.d ]]; then
    for rc in ~/.zshrc.d/*; do
        [[ -f "$rc" ]] && source "$rc"
    done
    unset rc
fi

# =============================================================================
# Aliases
# =============================================================================
alias ..="cd .."
alias la="ls -la"
alias dotfiles="cd ~/.dotfiles"
alias master="cd /home/nico/Nextcloud/Uni/Master"
alias projekte="cd /home/nico/Nextcloud/Projekte"
alias copy='xclip -selection clipboard'
alias j!=jbang

