# dotfiles
These are my configuration files.

## Installation with Stow

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage dotfiles via symlinks.

### Prerequisites

Install stow using your package manager:
```bash
# Fedora
sudo dnf install stow

# Arch
sudo pacman -S stow
```

### Usage

1. Clone this repository to your home directory:
```bash
   git clone <repo-url> ~/dotfiles
   cd ~/dotfiles
```

2. Install a configuration by running stow with the package name (folder name):
```bash
   stow zsh      # symlinks zsh config
   stow nvim     # symlinks neovim config
```

3. To install all configurations at once:
```bash
   stow */
```

4. To remove a configuration:
```bash
   stow -D zsh
```

### How it works

Stow creates symlinks from the dotfiles directory to your home directory, mirroring the folder structure. For example, `~/dotfiles/zsh/.zshrc` becomes `~/.zshrc`.
