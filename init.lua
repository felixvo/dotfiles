local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader            = " "
vim.g.maplocalleader       = " "

require('lazy').setup({

    {
      'nvim-tree/nvim-web-devicons',
    },

    -- colorscheme
    {
      'lifepillar/vim-gruvbox8', lazy = false,
      config = function()
        vim.cmd("colorscheme gruvbox8_hard")
      end
    },
    { 
      'rebelot/kanagawa.nvim',
      lazy = false,
      config = function()
--       vim.cmd("colorscheme kanagawa")
      end
    },
    -- {'chriskempson/base16-vim', lazy = false,},
    -- {'morhetz/gruvbox', lazy = false,},
    -- {'joshdick/onedark.vim', lazy = false,},
    -- {'bluz71/vim-nightfly-guicolors', lazy = false,},
    -- {'folke/tokyonight.nvim', lazy = false,},
    -- {'EdenEast/nightfox.nvim', lazy = false,},
    -- {'marko-cerovac/material.nvim', lazy = false,},

    -- statusline written in Lua
    -- settings in lua/evalline.lua
    {
      'nvim-lualine/lualine.nvim',
      lazy = false,
      config = function()
        require('evalline')
      end
    },

    -- git plugins
    -- alternative to 'airblade/vim-gitgutter'
    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup {
            signs = {
                add          = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
                change       = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
                delete       = { hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
                topdelete    = { hl = 'GitSignsDelete', text = '^', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
                changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
            },
        }
      end
    },
    'tpope/vim-fugitive',
    'junegunn/gv.vim',

    'tpope/vim-projectionist',
    -- markdown preview
    {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
    {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    },
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
    },
    {-- easy motion
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config

          require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
        end
    },
    {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup({})
      end
    },
    'mg979/vim-visual-multi',
    -- 'godlygeek/tabular',

    {
      'ahmedkhalf/project.nvim',
      config = function()
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
      end
    },
    {
      'lukas-reineke/indent-blankline.nvim',
      main = "ibl",
      config = function()
        require("ibl").setup {
            -- for example, context is off by default, use this to turn it on
            -- show_current_context = true,
            -- show_current_context_start = false,
        }
      end
    },
    {
      'windwp/nvim-ts-autotag',
      config = function()
        require('nvim-ts-autotag').setup()
      end
    },
    {
      'folke/todo-comments.nvim',
      config = function()
        require("todo-comments").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
      end
    },
    'p00f/nvim-ts-rainbow',
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
    	end
    },

    -- tabline
    -- use 'romgrk/barbar.nvim'
    {
      'akinsho/bufferline.nvim',
      lazy = false,
      version = "*",
      dependencies = 'nvim-tree/nvim-web-devicons',
      config = function()
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
      end
    },
    -- {
    --   'APZelos/blamer.nvim',
    --   config = function()
    --     vim.g.blamer_enabled = true
    --   end
    -- },

    -- similar to NERDTree/netrw
    {
      'kyazdani42/nvim-tree.lua',
      config = function()
        require("nvimtree")
      end
    },

    -- startup page
    {
      'goolord/alpha-nvim',
      lazy = false,
      config = function()
        require('startup_page')
      end
    },
    -- Which-key
    {
        'folke/which-key.nvim',
        event = "VeryLazy",
        init = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
        end,
        opts = {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
    },
    -- plenary is a common dependency for other Lua plugins
    'nvim-lua/plenary.nvim',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { "nvim-telescope/telescope-file-browser.nvim" },

    'junegunn/fzf',
    'junegunn/fzf.vim',

    -- LSP
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate", -- :MasonUpdate updates registry contents
      config = function()
      end
    },
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'hrsh7th/cmp-path',
    {
      "lukas-reineke/lsp-format.nvim",
      config = function()
        require("lsp-format").setup {}
      end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate go',
        config = function()
          require('treesitter')
        end
    },
    -- {
    --   'nvim-treesitter/nvim-treesitter-textobjects',
    --   config = function()
    --     require 'nvim-treesitter.configs'.setup {
    --       textobjects = {
    --           swap = {
    --               enable = true,
    --               swap_next = {
    --                   ["<leader>swn"] = "@parameter.inner",
    --               },
    --               swap_previous = {
    --                   ["<leader>swp"] = "@parameter.inner",
    --               },
    --           },
    --       },
    --       select = {
    --           enable = true,
    --
    --           -- Automatically jump forward to textobj, similar to targets.vim
    --           lookahead = true,
    --
    --           keymaps = {
    --               -- You can use the capture groups defined in textobjects.scm
    --               ["af"] = "@function.outer",
    --               ["if"] = "@function.inner",
    --               ["ac"] = "@class.outer",
    --               ["ic"] = "@class.inner",
    --           },
    --       },
    --     }
    --   end
    -- },

    {
      "glepnir/lspsaga.nvim",
      event = "LspAttach",
      config = function()
          require("lspsaga").setup({})
      end,
      dependencies = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
      }
    },
    -- show function signature when you type
    -- {
    --   'ray-x/lsp_signature.nvim',
    --   config = function()
    --     require "lsp_signature".setup({})
    --   end
    -- },
    -- {
    --   'folke/trouble.nvim',
    --   config = function()
    --     require("trouble").setup {
    --         icons = true,
    --         fold_open = "v", -- icon used for open folds
    --         fold_closed = ">", -- icon used for closed folds
    --         indent_lines = false, -- add an indent guide below the fold icons
    --         signs = {
    --             -- icons / text used for a diagnostic
    --             -- error = "error",
    --             -- warning = "warn",
    --             -- hint = "hint",
    --             -- information = "info"
    --         },
    --         use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
    --     }
    --   end
    -- },
    'nvim-telescope/telescope-ui-select.nvim',
    -- 'simrat39/rust-tools.nvim',

    -- Lua
    -- use {
    --     "folke/which-key.nvim",
    --     config = function()
    --         require("which-key"). {
    --             -- your configuration comes here
    --             -- or leave it empty to use the default settings
    --             -- refer to the configuration section below
    --         }
    --     end
    -- }
    --

    -- Ruby
    -- 'tpope/vim-rails',
    -- 'vim-ruby/vim-ruby',


    -- Test
    -- use 'vim-test/vim-test'
    -- use { "rcarriga/vim-ultest", dependencies = {"vim-test/vim-test"}, build = ":UpdateRemotePlugins" }
    -- {
    --   "nvim-neotest/neotest",
    --   dependencies = {
    --     "nvim-lua/plenary.nvim",
    --     "nvim-treesitter/nvim-treesitter",
    --     "antoinemadec/FixCursorHold.nvim",
    --     "olimorris/neotest-rspec"
    --   },
    --   config = function()
    --     require("neotest").setup {
    --       adapters = {
    --         require("neotest-rspec")
    --       },
    --       diagnostic = {
    --         enabled = true,
    --         severity = 1
    --       },
    --       floating = {
    --         border = "rounded",
    --         max_height = 0.6,
    --         max_width = 0.6,
    --         options = {}
    --       },
    --       output = {
    --         enabled = true,
    --         open_on_run = "short"
    --       },
    --       jump = {
    --         enabled = false
    --       },
    --       quickfix = {
    --         enabled = false,
    --         open = false
    --       },
    --       output_panel = {
    --         enabled = true,
    --         open = "botright split | resize 15"
    --       },
    --     }
    --   end
    -- },
})


vim.loader.enable()

require("lsp")
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
telescope.load_extension('projects')

