local function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function tmap(shortcut, command)
  map('t', shortcut, command)
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
nmap('<space>e', vim.diagnostic.open_float)
nmap('[d', vim.diagnostic.goto_prev)
nmap(']d', vim.diagnostic.goto_next)
nmap('<space>q', vim.diagnostic.setloclist)



nmap('<leader><leader>h', ":Telescope help_tags<cr>")

-- Find files using Telescope command-line sugar.
nmap('<leader>ff', ":Files<cr>")
-- nmap('<leader>ff', ":GFiles<cr>")
nmap('<leader>rf', ":lua require('telescope.builtin').recent_files()<cr>")
-- nmap('<leader>fg', ":lua require('telescope.builtin').live_grep()<cr>")
nmap('<leader>fg', ":Rg<cr>")
nmap('<leader>fb', ":Telescope file_browser<cr>")
vmap('<leader>fg', ":Rg <C-R><C-W><cr>")
nmap('<leader>bb', ":lua require('telescope.builtin').buffers()<cr>")
nmap('<leader>fh', ":lua require('telescope.builtin').help_tags()<cr>")
nmap('<leader>ttg', ":lua require('telescope.builtin').tags()<cr>")
nmap('<leader>ttG', ":lua require('telescope.builtin').current_buffer_tags()<cr>")

-- projects mapping
nmap('<leader>pp', ":Telescope projects<cr>")

nmap('<leader>cmd', ":lua require('telescope.builtin').commands()<cr>")


-- buffers
nmap('<leader>bd', ':bd<cr>')
nmap('<leader>bD', ':BufferLineCloseRight<cr>:BufferLineCloseLeft<cr>')
nmap('<leader>bP', ':BufferLineMovePrev<cr>')
nmap('<leader>bN', ':BufferLineMoveNext<cr>')
nmap('<C-h>', ':BufferLineCyclePrev<cr>')
nmap('<C-l>', ':BufferLineCycleNext<cr>')
nmap('<leader>bp', ':BufferLinePick<cr>')

nmap('<leader>Q', ':qall!<cr>')


-- This mapping makes macros even easier to remember
-- hit qq to record, q to stop recording, and Q to apply.
nmap('Q', '@q')
vmap('Q', ':norm @q<cr>')

-- NvimTree
nmap('<leader>ef', ':NvimTreeFindFile<cr>')
nmap('<leader>ee', ':NvimTreeToggle<cr>')

-- nmap('<leader>tt', ':NvimTreeFindFile<cr>')
-- nmap('1', ':NvimTreeFindFileToggle<cr>')
-- nmap('<leader>tf', ':NvimTreeFocus<cr>')


nmap('s', ':HopChar2<cr>')
nmap('<leader>wv', ':vs<cr>')
nmap('<leader>wg', ':sp<cr>')

vmap('YY', '"+y<cr>')
vmap('XX', '"+x<cr>')
nmap('<leader>fs', ':w<cr>')

vim.keymap.set('x', '<leader>p', "\"_dP")


-- GIT
nmap('<leader>gg', ':G<CR>')
nmap('<leader>gb', ':G branch<CR>')
nmap('<leader>gn', ':G checkout -b')
nmap('<leader>gd', ':G diff<CR>')
nmap('<leader>gc', ':G commit<CR>')
nmap('<leader>gp', ':G push<CR>')


-- close windows
nmap('<leader>wd', '<C-w>q<CR>')
nmap('<leader>wD', '<C-w>o<CR>')
nmap('<leader>wh', '<C-w>h<CR>')
nmap('<leader>wl', '<C-w>l<CR>')
nmap('<leader>wj', '<C-w>j<CR>')
nmap('<leader>wk', '<C-w>k<CR>')

--
--nmap('<leader>tc', ':tabnew<cr>')
--nmap('<leader>tC', ':tabclose<cr>')
--nmap('<leader>tn', ':tabn<cr>')
--nmap('<leader>tp', ':tabp<cr>')


--  moving line up/down
vmap('J', ":m '>+1<CR>gv=gv")
vmap('K', ":m '<-2<CR>gv=gv")

-- vmap('<leader>cc', ':Commentary<CR>')
-- nmap('<leader>cc', ':Commentary<CR>')


-- vmap('<Leader>a=', ':Tabularize /=<CR>')
-- vmap('<Leader>a:', ':Tabularize /:\zs<CR>')


-- floatterm
-- nmap('2', ':2ToggleTerm<cr>')
-- nmap('3', ':3ToggleTerm<cr>')
-- nmap('4', ':4ToggleTerm<cr>')
-- tmap('<esc>', '<C-\\><C-n>')
-- tmap('<S-esc>', '<C-\\><C-n>:ToggleTermToggleAll<cr>')



-- nmap('<C-u>', '<C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y>')
-- nmap('<C-d>', '<C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e><C-e>')

-- nmap('<leader>hr', '<Plug>RestNvim<CR>')


-- Tests
-- nmap('<leader>tt', ':lua require("neotest").run.run()<cr>')
-- nmap('<leader>tf', ':lua require("neotest").run.run(vim.fn.expand("%"))<cr>')
-- nmap('<leader>tp', ':  lua require("neotest").output_panel.toggle()<cr>')
