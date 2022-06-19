local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end


require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use 'wbthomason/packer.nvim'
  use 'lifepillar/vim-gruvbox8'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'junegunn/gv.vim'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-surround'
  use 'easymotion/vim-easymotion'
  use 'windwp/nvim-autopairs'
  use 'mg979/vim-visual-multi'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'mhinz/vim-startify'
  use 'kevinhwang91/nvim-bqf'
  use 'kyazdani42/nvim-tree.lua'
  use 'simrat39/rust-tools.nvim'
  use 'godlygeek/tabular'
  use 'romgrk/barbar.nvim'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

require 'bufferline'.setup {
  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = false,
}
require("nvimtree")
require("nvim-autopairs").setup {}

require('settings')
require('mappings')

require("lsp")
