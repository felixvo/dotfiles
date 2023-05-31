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
    use 'kyazdani42/nvim-web-devicons'

    -- :StartupTime for staruptime detail
    use 'dstein64/vim-startuptime'

    -- colorscheme
    use 'lifepillar/vim-gruvbox8'
    use 'rebelot/kanagawa.nvim'
    use 'chriskempson/base16-vim'
    -- use 'morhetz/gruvbox'
    use 'joshdick/onedark.vim'
    use 'bluz71/vim-nightfly-guicolors'
    use 'folke/tokyonight.nvim'
    use 'savq/melange'
    use 'jacoborus/tender.vim'
    use 'EdenEast/nightfox.nvim'
    use 'marko-cerovac/material.nvim'

    -- statusline written in Lua
    -- settings in lua/evalline.lua
    use 'nvim-lualine/lualine.nvim'

    -- git plugins
    -- alternative to 'airblade/vim-gitgutter'
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'
    use 'junegunn/gv.vim'

    use 'tpope/vim-projectionist'
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
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use 'ahmedkhalf/project.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'windwp/nvim-ts-autotag'
    use 'folke/todo-comments.nvim'
    use 'p00f/nvim-ts-rainbow'
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- tabline
    -- use 'romgrk/barbar.nvim'
    use 'akinsho/bufferline.nvim'
    use 'APZelos/blamer.nvim'

    use {
        "NTBBloodbath/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        commit = 'e5f68db73276c4d4d255f75a77bbe6eff7a476ef',
        config = function()
            require("rest-nvim").setup({
                -- Open request results in a horizontal split
                result_split_horizontal = false,
                -- Keep the http file buffer above|left when split horizontal|vertical
                result_split_in_place = false,
                -- Skip SSL verification, useful for unknown certificates
                skip_ssl_verification = false,
                -- Highlight request on run
                highlight = {
                    enabled = true,
                    timeout = 150,
                },
                result = {
                    -- toggle showing URL, HTTP info, headers at top the of result window
                    show_url = true,
                    show_http_info = true,
                    show_headers = true,
                },
                -- Jump to request line on run
                jump_to_request = false,
                env_file = '.env',
                custom_dynamic_variables = {},
                yank_dry_run = true,
            })
        end
    }

    -- similar to NERDTree/netrw
    use 'kyazdani42/nvim-tree.lua'

    -- startup page
    use 'goolord/alpha-nvim'

    -- plenary is a common dependency for other Lua plugins
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { "nvim-telescope/telescope-file-browser.nvim" }

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use 'hrsh7th/cmp-path'
    use "lukas-reineke/lsp-format.nvim"
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate go'
    }
    -- show function signature when you type
    use 'ray-x/lsp_signature.nvim'

    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- still has open issue https://github.com/folke/trouble.nvim/pull/175
    -- use "folke/trouble.nvim"
    use 'felixvo/trouble.nvim'

    use 'nvim-telescope/telescope-ui-select.nvim'

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
    --

    -- Ruby
    use 'tpope/vim-rails'
    use 'vim-ruby/vim-ruby'


    -- Test
    -- use 'vim-test/vim-test'
    -- use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
    use {
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "olimorris/neotest-rspec"
      },
    }


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

vim.loader.enable()

require 'bufferline'.setup {
    options = {
        color_icons = true,
        show_tab_indicators = true,
        diagnostics = "nvim_lsp",
        separator_style = "thin",
        buffer_close_icon = '',
        max_name_length = 50
    }
}
require("nvim-autopairs").setup {}
require("lsp")
require("nvimtree")
require('settings')
require('mappings')


local telescope = require('telescope')
telescope.setup {
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
        },
    },
    pickers = {
        colorscheme = {
            enable_preview = true
        },
        find_files = {
            --   theme = "dropdown",
            --
        },
        buffers = {
            --   theme = "dropdown",
        }
    },
    extensions = {
        -- ["ui-select"] = {
        --     require("telescope.themes").get_dropdown {
        --         -- even more opts
        --     }

        -- pseudo code / specification for writing custom displays, like the one
        -- for "codeactions"
        -- specific_opts = {
        --   [kind] = {
        --     make_indexed = function(items) -> indexed_items, width,
        --     make_displayer = function(widths) -> displayer
        --     make_display = function(displayer) -> function(e)
        --     make_ordinal = function(e) -> string
        --   },
        --   -- for example to disable the custom builtin "codeactions" display
        --      do the following
        --   codeactions = false,
        -- }
        -- },
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
    }
}
telescope.load_extension('projects')
telescope.load_extension('ui-select')
telescope.load_extension('fzf')
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
telescope.load_extension('file_browser')

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

telescope.load_extension('projects')

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
    icons = true,
    fold_open = "v", -- icon used for open folds
    fold_closed = ">", -- icon used for closed folds
    indent_lines = false, -- add an indent guide below the fold icons
    signs = {
        -- icons / text used for a diagnostic
        -- error = "error",
        -- warning = "warn",
        -- hint = "hint",
        -- information = "info"
    },
    use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
}

require('nvim-ts-autotag').setup()
require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}


require('Comment').setup()

require("lsp-format").setup {}


require 'nvim-treesitter.configs'.setup {
    textobjects = {
        swap = {
            enable = true,
            swap_next = {
                ["<leader>swn"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>swp"] = "@parameter.inner",
            },
        },
    },
    select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
        },
    },
}
require('startup_page')
vim.g.blamer_enabled = false



require("neotest").setup {
  adapters = {
    require("neotest-rspec")
  },
  diagnostic = {
    enabled = true,
    severity = 1
  },
  floating = {
    border = "rounded",
    max_height = 0.6,
    max_width = 0.6,
    options = {}
  },
  output = {
    enabled = true,
    open_on_run = "short"
  },
  jump = {
    enabled = false
  },
  quickfix = {
    enabled = false,
    open = false
  },
  output_panel = {
    enabled = true,
    open = "botright split | resize 15"
  },
}
