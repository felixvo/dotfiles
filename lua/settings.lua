vim.g.mapleader      = " "
vim.o.number         = true
vim.o.relativenumber = false
vim.o.wrap           = false
vim.o.expandtab      = true
vim.o.incsearch      = true
vim.o.tabstop        = 4
vim.o.cursorline     = true
vim.o.ignorecase     = true
vim.o.hlsearch       = false
vim.o.splitbelow     = true
vim.o.splitright     = true
vim.o.scrolloff      = 3
vim.o.errorbells     = false
vim.o.shiftwidth     = 4
vim.o.numberwidth    = 4
vim.o.termguicolors  = true
vim.o.colorcolumn    = '100'
vim.o.showmode       = false
vim.o.signcolumn     = 'yes'
vim.o.mouse          = 'a'
vim.o.ruler          = false
vim.o.wildmenu       = true
vim.o.hidden         = true
vim.o.cursorline     = true
vim.o.cursorcolumn   = false

vim.wo.foldmethod = 'indent'
vim.wo.foldlevel  = 4
vim.o.foldclose   = 'all'
vim.o.foldenable  = false

vim.o.backspace = 'indent,eol,start'
vim.o.termguicolors = true
--  When searching try to be smart about cases
vim.o.smartcase = true

vim.o.pumheight = 10 --Makes popup menu smaller
vim.o.fileencoding = 'utf-8' --The encoding written to file
vim.o.conceallevel = 0 -- So that I can see `` in markdown files


vim.o.smarttab    = true -- Makes tabbing smarter will realize you have 2 vs 4
vim.o.expandtab   = true -- Converts tabs to spaces
vim.o.smartindent = true -- Makes indenting smart
vim.o.autoindent  = true -- Good auto indent
vim.o.updatetime  = 50
vim.o.timeoutlen  = 1000
vim.o.ttimeoutlen = 50
vim.o.scrolloff   = 5


vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
-- Directories for swp files
vim.o.backup = false
vim.o.swapfile = true
vim.o.writebackup = false
vim.o.cmdheight = 1 -- More space for displaying messages
vim.o.scrolljump = 5
vim.o.lazyredraw = true
vim.o.ttyfast = true

vim.g.background = 'dark'

-- floaterm settings
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8

vim.o.guifont = "Cascadia Mono:h15"

vim.cmd([[ 
highlight clear SignColumn
highlight clear LineNr
"" colorscheme base16-oceanicnext
"" colorscheme base16-material-darker
colorscheme gruvbox8_hard 

""*****************************************************************************
""" Abbreviations
""*****************************************************************************
""" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev q1 q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
]])
