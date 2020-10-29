call plug#begin('~/.local/share/nvim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""
  " UI related
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'lifepillar/vim-solarized8'

  "" syntax highlight
  Plug 'vim-python/python-syntax'
  
  "" window navigate
  Plug 'christoomey/vim-tmux-navigator'

  "" Better Visual Guide
  Plug 'Yggdroot/indentLine'

  "" syntax check
  Plug 'w0rp/ale'

  "" Formater
  Plug 'sbdchd/neoformat'

""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Edit
  Plug 'jiangmiao/auto-pairs'
  Plug 'scrooloose/nerdcommenter'
  Plug 'terryma/vim-multiple-cursors'

  "" Fold
  Plug 'tmhedberg/simpylfold'

  "" better indentation
  Plug 'Vimjas/vim-python-pep8-indent'

  " send command to tmux pane
  Plug 'benmills/vimux'

  "" Auto-complete
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  "Plug 'zchee/deoplete-jedi'
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-jedi'

  "" File Explorer
  Plug 'scrooloose/nerdtree'

  "" Goto & Show docstring
  Plug 'davidhalter/jedi-vim'

  "" File finder and content searcher
  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'

  "" Quoting and Parenthesizing
  Plug 'tpope/vim-surround'

""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Auto format
  Plug 'psf/black', { 'tag': '19.10b0' }

"""""""""""""""""""""""""""""""""""""""""""""""""""
  " Git plugins
  Plug 'tpope/vim-fugitive'
  Plug 'shumphrey/fugitive-gitlab.vim'

call plug#end()

" NCM configuration
"" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

"" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

"" set short messages
set shortmess+=c

"" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC> 

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
   
" indentation setting
filetype indent on

" Git & gitlab configuration
let g:fugitive_gitlab_domains = ['https://gitlab.int.lastline.com']
let g:gitlab_api_keys = {'gitlab.int.lastline.com': 'iF72enUSLyEqz7kZdYhq'}

" fzf configuration
nnoremap <C-p> :Files<Cr>
nnoremap <C-f> :Ag<Cr>

" terminal colors configuration
" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
set termguicolors

" python-syntax config
let python_highlight_all = 1

" jedi-vim configuration
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"

" color theme configuration
set background=dark
colorscheme solarized8_high

" UI configuration
syntax on
syntax enable

set number
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw

" Tab and Indent config
set expandtab
set tabstop=4
set shiftwidth=4

" Nerdtree configuration
nmap <leader>t :NERDTree<cr>
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" Fold
let g:SimpylFold_docstring_preview = 0
let g:SimpylFold_fold_docstring = 0

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['pylint']}

" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" use ,d to close the buffer and switch to previous buffer
nmap ,d :b#<bar>bd#<CR>

" vimux configuration
"" use <leader>vp to run command in tmux pane
map <Leader>vp :VimuxPromptCommand<CR>
"" run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
"" change tmux pane orientation to horizontal (left-to-right)
let g:VimuxOrientation = "h"
"" change percent of the screen when split tmux pane
let g:VimuxHeight = "25"

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
