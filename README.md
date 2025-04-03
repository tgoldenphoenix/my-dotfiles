# Introduction

Hi, my name is AnHao

This dotfiles repo is for MacOS and Linux (Ubuntu). I don't know about Windows.

The software covered includes NeoVim, Zathura, Zsh, i3 Window Manager.

## Neovim

I use the [folke/lazy.nvim](https://github.com/folke/lazy.nvim) package manager.

I use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME) and some shell script to change between two NeoVim configs.  
The first config named `NeoTex` is only for working with LaTeX document. The second config named `LazyVim`, which is based on the NeoVim  
distro [Lazyvim](https://www.lazyvim.org/), is for working with markdown and other file type like lua, python, javascript.

My neovim version is:

- `v0.10.4` on my MacBook
- `` on my Ubuntu Dell Laptop

My NeoVim configurtion has some nice features, including:

- [VimTex](https://github.com/lervag/vimtex) integration
- QoL plugins:
  - [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)
  - 2

![Screenshot of the configuration](images/screenshot_cite.png)

The following sections provide installation instructions for Mac, and Ubuntu operating systems.

In the CheatSheet.md you can find all of the key-bindings that I have added to NeoVim for writing LaTeX documents and some other software in this configs.

## Table of Contents

toc

1. [Mac OS Installation](#Mac-OS-Installation)
2. [Ubuntu Linux Installation](#Arch-Linux-Installation)

## Mac OS Installation

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

## [zsh](https://fishshell.com/)

zsh

## Dependencies

Check to see that you have `git` installed by running the first command below, running the second if it is not installed already:

```bash
git --version
brew install git
```

Install Node if it is not installed already (you can check with `node --version` as above), run:

```bash
brew install node
```
