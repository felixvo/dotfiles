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
    --  use 'tpope/vim-vinegar'
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
    use 'voldikss/vim-floaterm'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate go'
    }


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
    -- Enable/disable close button
    closable = false,
}
require("nvim-autopairs").setup {}
require("lsp")
require("nvimtree")
require('settings')
require('mappings')


require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "go", "lua", "rust" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- List of parsers to ignore installing (for "all")
    ignore_install = {
        -- "javascript"
    },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = {
            -- "c",
            -- "rust",
        },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
