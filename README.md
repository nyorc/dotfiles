# Dotfiles

nyorc's dotfiles. Manage dotfiles on mac and debian.

[TOC]

## Requirements

- Git
- GNU Make
- GNU Stow
- Homebrew (macOS)
- apt (Debian)

### macOS

Install homebrew
```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install git, make, stow
```bash
$ brew install git make stow
```

Replace macOS default make with GNU make
```
PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
```

#### Debian/Ubuntu

Install git, make, stow
```bash
$ sudo apt update && sudo apt install -y git make stow
```

## Install dotfiles

Clone dotfiles repository
```bash
$ git clone git@github.com:nyorc/dotfiles.git ~/.dotfiles
```

## Stow Dotfile Naming Convention

When using `stow --dotfiles`, Stow automatically converts file names:
- Files prefixed with `dot-` become files prefixed with `.`
- Example: `dot-gitconfig` → `~/.gitconfig`
- Example: `dot-zshrc` → `~/.zshrc`

This avoids issues with hidden files in version control and makes dotfiles visible in the repository.

## Previously Used Tools

- [homemaker](https://github.com/FooSoft/homemaker): No longer maintained by the author. It was convenient to define dotfile deployment with TOML, but adding extra commands or variables made it more complex and harder to maintain.
- Ansible: Very powerful and can handle all tasks, but the maintenance cost is high. Simple shell commands become more complicated as you need to find the right module, and testing requires meeting both the module's requirements and the system environment.

## Reference

- https://brew.sh/
- https://www.gnu.org/software/stow/manual/stow.html