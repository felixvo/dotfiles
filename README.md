
## Setup Neovim
```
ln -sf ~/dotfiles/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/lua ~/.config/nvim/lua
ln -s ~/dotfiles/colors ~/.config/nvim/colors
```

## Kitty Term
```
ln -sf ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
```

## Brew

```
brew install zsh fd ripgrep git tree jq tldr exa node tig lazygit pgcli mycli stern yq

brew install fzf
$(brew --prefix)/opt/fzf/install

brew install --cask alfred iterm2 spectacle visual-studio-code font-jetbrains-mono
npm install dotenv
```

## Fonts

```
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font font-iosevka-nerd-font font-victor-mono-nerd-font font-caskaydia-cove-nerd-font
```
