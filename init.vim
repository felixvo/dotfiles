"" vim-bootstrap b0a75e4
"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif
let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
"Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'lifepillar/vim-gruvbox8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'windwp/nvim-autopairs'
""Plug 'liuchengxu/vim-which-key'
"Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi'
"Plug 'francoiscabrol/ranger.vim'
"Plug 'rbgrouleff/bclose.vim'

"Plug 'voldikss/vim-floaterm'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'rhysd/vim-clang-format'

""Plug 'Yggdroot/indentLine'
""Plug 'yegappan/mru'

""Plug 'metakirby5/codi.vim'

"LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' " Snippets plugin

"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"" Vim start screen
Plug 'mhinz/vim-startify'
"" Use release branch (recommend)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" CLOJURE
""Plug 'tpope/vim-fireplace'

""Plug 'wellle/context.vim'
""
"" JAVASCRIPT
"Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
"Plug 'terryma/vim-multiple-cursors'

"" Markdown
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
""Plug 'godlygeek/tabular'


Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
"Plug 'scrooloose/nerdtree'

""" Snippets
""Plug 'SirVer/ultisnips'
""Plug 'honza/vim-snippets'

""Plug 'w0rp/ale'
""Tagbar
"Plug 'majutsushi/tagbar'

""Prettier
"" post install (yarn install | npm install) then load plugin only for editing supported files
""Plug 'prettier/vim-prettier', {
""  \ 'do': 'yarn install'}
"" enable for custom file  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

"if isdirectory('/usr/local/opt/fzf')
"  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
"else
"  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"  Plug 'junegunn/fzf.vim'
"endif

""*****************************************************************************
""" Custom bundles
""*****************************************************************************

"" go
""" Go Lang Bundle
"Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
"Plug 'buoto/gotests-vim'
""Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

"" RUST"
Plug 'simrat39/rust-tools.nvim'

""*****************************************************************************
""*****************************************************************************

""" Include user's extra bundle
"if filereadable(expand("~/.rc.local.bundles"))
"  source ~/.rc.local.bundles
"endif

call plug#end()


"Required
"
filetype plugin indent on
" END Plugins---------
syntax on
"" Load other config

"" true color
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


"END Color/Theme --------------------------------
"
" Basic config, try :help wildmenu for more info about the config
"
set encoding=utf-8

set termguicolors " this variable must be enabled for colors to be applied properly
"https://unix.stackexchange.com/questions/186166/delete-key-doesnt-work-on-vim-insert-mode-for-deleting-previously-typed-conte
"
set backspace=indent,eol,start
set ruler " bottom right row/column
set number " vertical left line number

set path+=**

set wildmenu
" fold
set foldmethod=indent
set foldlevel=3
set foldclose=all
set nofoldenable

set nohlsearch
set hidden

set cursorline
set cursorcolumn

highlight clear SignColumn
highlight clear LineNr
" vertical 
set colorcolumn=120

" Ignore case when searching
set ignorecase

"" Status bar
set laststatus=1

" When searching try to be smart about cases
set smartcase

set mousemodel=popup
set mouse=a
set t_Co=256
"set guioptions=egmrti
"set guifont=CascadiaMono:h12

set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file

set nowrap
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set conceallevel=0                      " So that I can see `` in markdown files
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set smartindent
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set updatetime=50
set timeoutlen=1000
set ttimeoutlen=50
set incsearch
set scrolloff=5

"set showtabline=2                       " Always show tabs 
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
"" Directories for swp files
set nobackup
set noswapfile
set nowritebackup                       " This is recommended by coc
"switch from insert->command mode faster
set cmdheight=2                         " More space for displaying messages

"fix slow scrolling in vim
"disable auto matching parens
"let g:loaded_matchparen=1

set nocursorline
set nocursorcolumn
set scrolljump=5
"set synmaxcol=280

" don't render special chars (tabs, trails, ...)
set nolist

" lazy drawing
set lazyredraw
set ttyfast

"" GENERAL
" Color/Theme
set background=dark
"colorscheme gruvbox8_hard
colorscheme OceanicNext


""Here's a handy command to remove whitespaces on save.
""autocmd BufWritePre * :%s/\s\+$//e

"if exists('$SHELL')
"    set shell=$SHELL
"else
"    set shell=/bin/sh
"endif

"" Empty value to disable preview window altogether
"let g:fzf_preview_window = []
"" Preview window on the upper side of the window with 40% height,
"" hidden by default, ctrl-/ to toggle
""let g:fzf_preview_window = ['right:40%', 'ctrl-/']


"command! -nargs=0 Prettier :CocCommand prettier.formatFile

"""" KEYS
let mapleader=' '
"let g:BufKillCreateMappings = 0
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
"" END Basic config ----------
"" Mappings
""
"" next/previous buffer
"map <leader>bn :bn!<CR>
"map <leader>bp :bp!<CR>

""nnoremap <silent> <leader> :WhichKey ','<CR>

""Tabularize
""vnoremap <Leader>a= :Tabularize /=<CR>
""vnoremap <Leader>a: :Tabularize /:\zs<CR>

"let g:ranger_map_keys = 0
"map <leader>frg :Ranger<CR>
"
map <leader>cc :Commentary<CR>

"noremap <leader>wh <C-w>h
"noremap <leader>wj <C-w>j
"noremap <leader>wk <C-w>k
"noremap <leader>wl <C-w>l

""

"" map scrolling
"nmap <C-u> <C-y><C-y><C-y><C-y><C-y><C-y><C-y>
"nmap <C-d> <C-e><C-e><C-e><C-e><C-e><C-e><C-e>

""
"" moving line up/down
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

""close buffer
map <leader>wd <C-w>q<CR>
map <leader>wD <C-w>o<CR>


"noremap <leader>ft :TagbarToggle<CR>


""" GIT
nmap <leader>gg :G<CR>
nmap <leader>gb :G branch<CR>
nmap <leader>gn :G checkout -b 
nmap <leader>gd :G diff<CR>
nmap <leader>gc :G commit<CR>
nmap <leader>gp :G push<CR>


"" vertical resize
"" map <F8> :vertical resize +10<CR>
"" map <F7> :vertical resize -10<CR>
"" map <F9> :Tagbar<CR>
""map _ <c-w>-
""map + <c-w>+
"" nnoremap <leader><leader>- :vertical resize -10<cr>
"" nnoremap <leader><leader>= :vertical resize +10<cr>
"" nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
"" nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

nnoremap <leader>fs :w<cr>
"" list buffers
"nnoremap <silent> <leader>b :Buffers<CR>

""" Copy/Cut to clipboard
noremap YY "+y<CR>
noremap XX "+x<CR>

"" nmap <leader>T :GoTestFunc<CR>
"" imap <leader>T :GoTestFunc<CR>
"" noremap <leader>I :GoInfo<CR>

"" split horizontal
map <leader>wv :vs<CR>
map <leader>wg :sp<CR>

"noremap <leader>et :Lex<CR>
"noremap <leader>ee :CocCommand explorer<CR>
""nmap <F8> :TagbarToggle<CR>
"" Search for selected text
"vnoremap // y/<C-R>"<CR>

"vnoremap <leader>rg y:Rg <C-R>"<CR>

""  fuzzy find
"nnoremap <silent> <leader>ff :FZF -m<CR>
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"buffers
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>bd :bd<cr>
map <C-h> :bp<CR>
map <C-l> :bn<CR>
" Using Lua functions
"
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"noremap <leader>q :q!<cr>

"" This mapping makes macros even easier to remember
"" hit qq to record, q to stop recording, and Q to apply.
"nnoremap Q @q
"vnoremap Q :norm @q<cr>


""nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
""nnoremap <leader>d :call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact --select-1 --exit-0 +i'})<CR>
""Ale
"" nmap <silent> <C-J> :ALENext<CR>
"" nmap <silent> <C-K> :ALEPrevious<CR>

"" show autocomplete
"inoremap <expr> <C-j> pumvisible() ? '<C-n>' : 'j'
"inoremap <expr> <C-k> pumvisible() ? '<C-p>' : 'k'

"" autocomplete

""
"" set completeopt=noinsert,menuone
"" You can use Ctrl-O to remap Ctrl-h/j/k/l to move the cursor while in insert mode without using the arrow keys:
"" imap <C-h> <C-o>h
"" imap <C-l> <C-o>l


"" Floaterm
"let g:floaterm_keymap_toggle = '<F12>'


""nnoremap <leader>r :w <CR>:!g++ -std=c++11 -O2 -Wall % -o %:r && ./%:r<CR>

"source ~/dotfiles/coc.vim


"autocmd FileType json syntax match Comment +\/\/.\+$+

"let g:go_term_enabled=0
"let g:go_auto_type_info = 1
""let g:go_info_mode = 'gocode'
"let g:go_echo_command_info = 0
""let g:go_statusline_duration = 500
"let g:go_auto_sameids = 0
"let g:go_updatetime = 800
"let g:go_fmt_autosave = 0
""let g:go_def_mode = 'godef'
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_extra_types = 0
"let g:go_highlight_fields = 0
"let g:go_highlight_functions = 0
"let g:go_highlight_methods = 0
"let g:go_highlight_operators = 0
"let g:go_highlight_structs = 0
"let g:go_highlight_types = 0
"let g:go_fmt_command = "gofmt"

"let g:go_rename_command = 'gopls'
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'

""" https://stackoverflow.com/a/1625850
set backupdir=~/vimtmp//,.
set directory=~/vimtmp//,.

""
"" Godef
""let g:godef_split=4
""let g:godef_same_file_in_same_window=1
""set splitright
""autocmd BufWinEnter,WinEnter term://* startinsert

"" FZF Config
"" " This is the default extra key bindings
"let g:fzf_action = {
"  \ 'ctrl-t': 'tab split',
"  \ 'ctrl-x': 'split',
"  \ 'ctrl-v': 'vsplit' }

"set wildmode=list:longest,list:full
"set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
"let $FZF_DEFAULT_OPTS = '--info=inline'
"let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'vendor/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

"let g:fzf_tags_command = 'ctags -R'

"" The Silver Searcher
"if executable('ag')
"  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
"  set grepprg=ag\ --nogroup\ --nocolor
"endif

"" ripgrep
"if executable('rg')
"  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
"  set grepprg=rg\ --vimgrep
"  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
"endif


set signcolumn=yes

""Import Go Packages
"augroup gopkgs
"  autocmd!
"  autocmd FileType go command! -buffer GoImport call fzf#run({
"              \  'source': 'gopkgs',
"              \  'sink': 'GoImport'
"              \  })
"  autocmd FileType go command! -buffer GoDoc call fzf#run({
"             \ 'source': 'gopkgs',
"             \ 'sink': 'GoDoc'
"             \ })
"augroup END

"" Launch gopls when Go files are in use
"" let g:LanguageClient_serverCommands = {
""        \ 'go': ['gopls']
""        \ }

""" Netrw
"" https://shapeshed.com/vim-netrw/
let g:netrw_banner       = 0
let g:netrw_liststyle    = 0
let g:netrw_browse_split = 0
let g:netrw_altv         = 1
let g:netrw_winsize      = 25
let g:netrw_usetab       = 1

""" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"" Error and warning signs.
"" let g:ale_sign_error = '⤫'
"" let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'

"" easymotion
""" Easy motion"
let g:EasyMotion_smartcase = 1
"map <leader><leader>s <Plug>(easymotion-sn)
"let g:EasyMotion_do_mapping = 0 " Disable default mappings
"" Gif config
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
"" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
"" Without these mappings, `n` & `N` works fine. (These mappings just provide
"" different highlight method and have some other features )
""map  n <Plug>(easymotion-next)
""map  N <Plug>(easymotion-prev)
""
"" Jump to anywhere you want with minimal keystrokes, with just one key binding.
"" `s{char}{label}`
nmap <leader>j <Plug>(easymotion-overwin-f2)
"" or
"" `s{char}{char}{label}`
"" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-overwin-f2)

"" Turn on case-insensitive feature
"let g:EasyMotion_smartcase = 1

"" JK motions: Line motions
""map <Leader>j <Plug>(easymotion-j)
""map <Leader>k <Plug>(easymotion-k)

"" auto-pairs  disable <C-h> to delete matched brackets conflict with <C-h> below
"let g:AutoPairsMapCh = 0

"" returns all modified files of the current git repo
"" `2>/dev/null` makes the command fail quietly, so that when we are not
"" in a git repo, the list will be empty
"function! s:gitModified()
"    let files = systemlist('git ls-files -m 2>/dev/null')
"    return map(files, "{'line': v:val, 'path': v:val}")
"endfunction

"" same as above, but show untracked files, honouring .gitignore
"function! s:gitUntracked()
"    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
"    return map(files, "{'line': v:val, 'path': v:val}")
"endfunction

"autocmd FileType c ClangFormatAutoEnable
"autocmd FileType cpp ClangFormatAutoEnable
"" let g:ale_fixers = {
""   \    'javascript': ['eslint','prettier'],
""   \    'typescript': ['prettier', 'tslint'],
""   \    'vue': ['eslint'],
""   \    'scss': ['prettier'],
""   \    'html': ['prettier'],
""   \    'reason': ['refmt']
"" \}
"" let g:ale_fix_on_save = 1

""" ignore in YouComplemeMe
"" let g:ycm_filetype_specific_completion_to_disable = {
""       \ 'gitcommit': 1
""       \}

" augroup FastEscape
"     autocmd!
"     au InsertEnter * set timeoutlen=0
"     au InsertLeave * set timeoutlen=500
" augroup END

"set list
"set listchars=tab:\·\ "there is a space after the last ·"
""set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,space:·,trail:·

"" ctags
"set tags=tags

"NvimTree

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>


