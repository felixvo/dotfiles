local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    print("setting up Packer...")
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })

    -- https://github.com/wbthomason/packer.nvim/issues/750
    -- fix boostrap not work for new setup
    vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end


require('packer').startup({ function(use)

    -- Packer
    use 'wbthomason/packer.nvim'

    -- :StartupTime for staruptime detail
    use 'dstein64/vim-startuptime'

    -- colorscheme
    use 'lifepillar/vim-gruvbox8'
    use 'joshdick/onedark.vim'
    use 'bluz71/vim-nightfly-guicolors'
    use 'folke/tokyonight.nvim'
    use 'savq/melange'
    use 'jacoborus/tender.vim'

    --  Speed up loading Lua modules in Neovim to improve startup time.
    use 'lewis6991/impatient.nvim'

    -- statusline written in Lua
    -- settings in lua/evalline.lua
    use 'nvim-lualine/lualine.nvim'

    -- git plugins
    -- alternative to 'airblade/vim-gitgutter'
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'
    use 'junegunn/gv.vim'

    -- common plugins
    use { "ellisonleao/glow.nvim", branch = 'main' }
    use 'numToStr/Comment.nvim'
    use 'tpope/vim-surround'
    use { -- easy motion
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
        end
    }
    use 'windwp/nvim-autopairs'
    use 'mg979/vim-visual-multi'
    use 'godlygeek/tabular'
    use {
        "akinsho/toggleterm.nvim",
        tag = 'v1.*',
        config = function()
            require("toggleterm").setup({
                -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
                direction = 'float',
            })
        end
    }

    use 'ahmedkhalf/project.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'windwp/nvim-ts-autotag'
    use 'folke/todo-comments.nvim'
    use 'karb94/neoscroll.nvim'

    -- tabline
    use 'romgrk/barbar.nvim'

    -- similar to NERDTree/netrw
    use 'kyazdani42/nvim-tree.lua'

    -- startup page
    use 'mhinz/vim-startify'

    -- plenary is a common dependency for other Lua plugins
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'hrsh7th/cmp-path'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate go'
    }
    -- show function signature when you type
    use 'ray-x/lsp_signature.nvim'

    -- still has open issue https://github.com/folke/trouble.nvim/pull/175
    -- use "folke/trouble.nvim"
    use 'felixvo/trouble.nvim'

    use 'simrat39/rust-tools.nvim'
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

require('impatient')

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

require "lsp_signature".setup({})

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
require('treesitter')

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
require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
require('Comment').setup()
require('neoscroll').setup({
})
