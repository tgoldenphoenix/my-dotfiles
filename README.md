# README.md

## Table of Contents

!TODO: add TOC

## Introduction

Hi, my name is An Hao 👋.

This dotfiles repo is for my MacOS and Linux (Ubuntu) machines. I don't know about Windows.

I am now working mainly on a Macbook machine and only switch to Linux sometime to learn a few thing. I plan to switch entirely to Linux in the future.

The main softwares covered in this repo includes: **NeoVim, Tmux, Zsh, a tiling-window manager (i3 or yabai)**. Other software includes: Zathura, Karabiner, yazi, sketchybar...

## Neovim

I use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME) and some shell script to change between two NeoVim configs.  
The first config named `NeoTex` is only for working with LaTeX document. The second config named `LazyVim`, which is based on the NeoVim distro [Lazyvim](https://www.lazyvim.org/), is for working with markdown and other file type like lua, python, javascript.

My neovim version is:

- `v0.10.4` on my MacBook
- `` on my Ubuntu Dell Laptop

My NeoVim configurtions has some nice features.

### Common features to both configs

- QoL plugins:
  - [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)
  - 2

### LazyVim config features

lazyvim

### NeoTex configs features

I use the [folke/lazy.nvim](https://github.com/folke/lazy.nvim) package manager.

- [VimTex](https://github.com/lervag/vimtex) integration

![Screenshot of the configuration](images/screenshot_cite.png)

The following sections provide installation instructions for Mac, and Ubuntu operating systems.

In the CheatSheet.md you can find all of the key-bindings that I have added to NeoVim for writing LaTeX documents and some other software in this configs.

## Other software in my configs

### [Karabiner-Elements](https://karabiner-elements.pqrs.org/)

I use Karabiner to re-map the cap-lock key to act as:
- Escape when tap
- Ctrl when holding with other keys

### yabai & skhd (MacOS) and i3 wm (Linux)

[Yabai](https://github.com/koekeishiya/yabai) and skhd are used together to produce a tiling window manager experience on MacOS. On Linux, I use [i3 window manager](https://i3wm.org/).

### tmux

I currently have three tmux sessions that I always go to which are:
1. My local ~/.config repository
2. My LaTeX directory
3. My markdown directory where I write all my notes

I also have other tmux sessions for other project such as python, practice vim motion, review javascript code

### zsh

In my zsh shell, I have a few add-on features such as:
1. one

### GNU Stow

I keep all my dotfiles inside a single repo that I push to GitHub and use [GNU Stow](https://www.gnu.org/software/stow/) to create symlinks to appropriate locations on my home directory.

### WezTerm terminal emulator

I just use it because other people recommend it.

## Mac OS Installation Instruction

I would start by updating your system so that you don't hit any snags along the way.
(Or, if you like snags and tired of Mac, then consider switching to Linux!)
Once you have updated MacOS, open the terminal by hitting `Command + Space` and typing 'terminal'.
You may check whether you already have Homebrew installed by entering the following into the terminal:

```bash
brew --version
```

If Homebrew is installed, it will report which version you have which you can update by means of the following commands run separately in order:

```bash
brew update
brew doctor
brew upgrade
```

### [zsh](https://fishshell.com/)

zsh

### Dependencies

Check to see that you have `git` installed by running the first command below, running the second if it is not installed already:

```bash
git --version
brew install git
```

Install Node if it is not installed already (you can check with `node --version` as above), run:

```bash
brew install node
```

## Linux Installation Instruction