# Plasma dotfiles

This repo contains all my dotfiles for my linux system

## Requirements

Ensure you have the following installed on your system

### Git

Arch linux
```
pacman -S git
```
### Stow

Arch linux
```
pacman -S stow
```

## Installation

Clone the repository in your $HOME directory using git

```
$ git clone https://github.com/harsh661/dotfiles.git
$ cd dotfiles
```

then use Stow to create symlinks

```
$ stow .
```