local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })

    -- https://github.com/wbthomason/packer.nvim/issues/750
    -- fix boostrap not work for new setup
	vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end


require('packer').startup({ function(use)

    -- My plugins here
    use 'wbthomason/packer.nvim'
    use 'lifepillar/vim-gruvbox8'
    use 'joshdick/onedark.vim'
    use 'bluz71/vim-nightfly-guicolors'
    use 'folke/tokyonight.nvim'
    use 'savq/melange'
    use 'jacoborus/tender.vim'

    --  Speed up loading Lua modules in Neovim to improve startup time.
    use 'lewis6991/impatient.nvim'

    -- use 'vim-airline/vim-airline'
    -- use 'vim-airline/vim-airline-themes'

    -- use 'nvim-lualine/lualine.nvim'
    use 'nvim-lualine/lualine.nvim'

    -- use 'airblade/vim-gitgutter'
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'junegunn/gv.vim'
    --  use 'tpope/vim-vinegar'
    use 'tpope/vim-surround'
    use 'easymotion/vim-easymotion'
    use 'windwp/nvim-autopairs'
    use 'mg979/vim-visual-multi'
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'mhinz/vim-startify'
    --    use 'kevinhwang91/nvim-bqf'
    use 'kyazdani42/nvim-tree.lua'
    use 'simrat39/rust-tools.nvim'
    use 'godlygeek/tabular'
    use 'romgrk/barbar.nvim'
    use 'voldikss/vim-floaterm'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate go'
    }


    use {
        "ray-x/lsp_signature.nvim",
    }
    use 'ahmedkhalf/project.nvim'
    use "lukas-reineke/indent-blankline.nvim"


    -- still has open issue https://github.com/folke/trouble.nvim/pull/175
    -- use "folke/trouble.nvim"
    use 'felixvo/trouble.nvim'

    use 'windwp/nvim-ts-autotag'

    -- Lua
    -- use {
    --     "folke/which-key.nvim",
    --     config = function()
    --         require("which-key").setup {
    --             -- your configuration comes here
    --             -- or leave it empty to use the default settings
    --             -- refer to the configuration section below
    --         }
    --     end
    -- }


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    },
    profile = { -- https://github.com/wbthomason/packer.nvim#profiling
        enable = true,
        threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
    }
}
)

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


require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<ESC>"] = "close",
                ["<C-k>"] = "move_selection_previous",
                ["<C-j>"] = "move_selection_next",
            },
        }
    },
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    }
}

require("project_nvim").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    -- Telescope mappings
    --
    -- project.nvim comes with the following mappings:

    -- Normal mode	Insert mode	Action
    -- f	<c-f>	find_project_files
    -- b	<c-b>	browse_project_files
    -- d	<c-d>	delete_project
    -- s	<c-s>	search_in_project_files
    -- r	<c-r>	recent_project_files
    -- w	<c-w>	change_working_directory

    -- When set to false, you will get a message when project.nvim changes your
    -- directory.
    silent_chdir = true,
    patterns = { ".git", "package.json" },
}

require('telescope').load_extension('projects')


require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    -- ensure_installed = { "go", "lua", "rust", "javascript", "typescript", "html", "svelte" },
    ensure_installed = "all",

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

require "lsp_signature".setup({

})

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = false,
}
require('gitsigns').setup {
    signs = {
        add          = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change       = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete       = { hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete    = { hl = 'GitSignsDelete', text = '^', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    },
}
require('evalline')

require("trouble").setup {
    icons = false,
    fold_open = "v", -- icon used for open folds
    fold_closed = ">", -- icon used for closed folds
    indent_lines = false, -- add an indent guide below the fold icons
    signs = {
        -- icons / text used for a diagnostic
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}


require('nvim-ts-autotag').setup()
