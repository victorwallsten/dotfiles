# dotfiles

A bare repository of my public GNU/Linux configuration files.

* [bashrc](.bashrc)
* [dircolors](.config/dircolors/dircolors) (colour setup for `ls`)
* [Lynx](.config/lynx) (text-based web browser)
    * [config](.config/lynx/lynx.cfg)
    * [colours](.config/lynx/lynx.lss)
* [Neovim](.config/nvim) (text editor)
    * [init.vim](.config/nvim/init.vim) (vimrc equivalent)
    * [LSP (Language Server Protocol)](.config/nvim/lsp.vim)
    * [Treesitter + Playground](.config/nvim/treesitter.vim) (syntax highlighting)
    * [Plugin submodules](.config/nvim/pack/plugins/opt)
        * [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
        * [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
            * [playground](https://github.com/nvim-treesitter/playground)
        * [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized) (colour scheme)
        * [vimtex](https://github.com/lervag/vimtex) (LaTeX utility)
* [XMonad](.config/xmonad/xmonad.hs) (window manager)
    * [xmobar](.config/xmobar/xmobarrc) (status bar)
* [Xresources](.config/Xresources/Xresources)
    * [solarized submodule](https://github.com/solarized/xresources) (colour scheme)
* [Xsession](.xsession)

## Install

Dependencies:
* `git`

Add an alias to your shell (and .bashrc or equivalent):

```bash
alias dotfiles='git --git-dir=$HOME/repos/dotfiles/ --work-tree=$HOME'
```

Add the git directory to .gitignore to avoid possible recursion problems:

```bash
echo "repos/dotfiles" >> $HOME/.gitignore
```

Clone the bare repository into the git directory:

```bash
git clone --bare https://github.com/victorwallsten/dotfiles.git $HOME/repos/dotfiles
```

Disable showing untracked files (in `dotfiles status` and similar commands):

```bash
dotfiles config --local status.showUntrackedFiles no
```

Checkout the files to the working tree:

```bash
dotfiles checkout
```

Done! If you wish, set up a remote repository of your own and add your updates:

```bash
dotfiles branch -M main
dotfiles remote set-url origin <remote-url>

dotfiles add <path/to/dotfile>
dotfiles commit
dotfiles push -u origin main
```

Happy hacking!
