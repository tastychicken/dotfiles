# Setup

I've been following this tutorial for my dotfiles:
https://www.atlassian.com/git/tutorials/dotfiles

Before we can retrieve the dotfiles we have to install zsh.

Verify that we have the latest updates:  
`sudo apt update`

Then we install zsh, curl, tmux, git and oh-my-zsh:
```
sudo apt install zsh -y
sudo apt install curl
sudo apt install tmux
sudo apt install git
```

We also need oh-my-zsh:  
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

And powerline fonts, where we clone the repo and then run their install script:
```
cd
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
```

Verify that it installed by running:  
`zsh --version`

Create a temporary `config` alias:  
`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`

Add the .cfg-folder to .gitignore:  
`echo ".cfg" >> .gitignore`

Checkout our dotfiles into a bare .cfg folder:  
`git clone --bare https://github.com/tastychicken/dotfiles $HOME/.cfg`

Reset the temporary `config` alias:  
`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`

---

# Neovim

Install neovim:  
`sudo apt install neovim`

Comment out the `require('set')` and `require('remap')` lines from the vim config `init.lua` in `~/.config/nvim`.

Install packer:  
https://github.com/wbthomason/packer.nvim

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Run the `vi` (alias for `nvim`) command and run `:PackerSync` in nvim.

---

# Gnome

Set dash to dock action:  
`gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'focus-minimize-or-previews'`
