## neovim-config 

This repositories contains my configuration for neovim.

It was inspired from [ThePrimeagen](https://github.com/ThePrimeagen/init.lua) repository and refactored to fit my needs.

### Usage

You first need to install ripgrep : 

```bash
sudo apt install ripgrep
```

Then you can clone this git repository : 

```bash
git clone git@github.com:rustx/neovim-config
```

Finally you can create a symlink to link this repository to your local nvim config folder : 

```bash
ln -sr neovim-config $HOME/.config/nvim
```

### Neovim installation 

To enjoy the latest neovim version on ubuntu, you can use the stable ppa : 

```bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim
```

More information to install neovim can be found on the [project Github Page](https://github.com/neovim/neovim/wiki/Installing-Neovim)

### Plugin installation

The packer plugins should be synced to have everyhthing working as expected : 

```bash
:PackerSync
```

### Switch themes

This repository contains multiple themes in the [theme](lua/teknicity/theme) folder.

If you would like to change theme, please just update the requirement in the [init.lua](lua/teknicity/theme/init.lua) package file.

