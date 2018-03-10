
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Plugin 'nanotech/jellybeans.vim'
Plugin 'Yggdroot/indentLine'
" Plugin 'morhetz/gruvbox'
Plugin 'nightsense/vimspectr'
Plugin 'gregsexton/Atom'
Plugin 'chemzqm/vim-jsx-improve'

Plugin 'rakr/vim-one'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'Yggdroot/duoduo'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'jiangmiao/auto-pairs'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'

Plugin 'easymotion/vim-easymotion'
Plugin 'kshenoy/vim-signature'
"Plugin 'letientai299/vim-react-snippets', { 'branch': 'es6'  }"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" KEY REMAPS
let mapleader = "\<Space>"
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
nnoremap <silent> <leader>s :sp<cr>
nnoremap <silent> <leader>o :on<cr>
nnoremap <silent> <leader>e $<cr>

let g:airline_theme = 'one'
" Remove whitespace on save
" autocmd BufWritePre *.js :%s/\s\+$//e
" Blink cursor instead of bell
set visualbell
" Set line numbers
set number
set ruler
syntax on
set expandtab
""show existing tab with 4 spaces width
set tabstop=2
"" when indenting with '>', use 4 spaces width
set shiftwidth=2
"" On pressing tab, insert 4 spaces
set expandtab
set relativenumber
"" let g:indentLine_enabled = 1
set background=dark
colorscheme one

" Search Configs
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

nnoremap <silent> <leader>p :Files<cr>
nnoremap <silent> <leader>o :Buffers<CR>
nnoremap <silent> <leader>fl :Lines<CR>
nnoremap <silent> <leader>? :History/<CR>

"Splt more natural                                                                                                                                                                                         
set splitbelow                                                                                                                                                                                            
set splitright

" Window resize
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

nnoremap <silent> <leader>' :s/\'\(.*\)\'/\"\1\"
nnoremap <silent> <leader>" :s/\"\(.*\)\"/\'\1\'

let g:hybrid_custom_term_colors = 1
setlocal omnifunc=javascriptcomplete#completejs
set listchars=tab:\|\ 
set list

let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_layout = { 'up': '~20%' }

" let g:ctrlp_map='<c-p>'
" let g:ctrlp_cmd = 'ctrlpmixed'

set t_co=256
" ABREVIATIONS
ab teh the
ab proptype PropTypes
ab cdm componentDidMount()
ab cwm componentWillMount()
ab scu shouldComponentUpdate()
ab compoenent component

autocmd BufWritePre *.py :%s/\s\+$//e

" let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> <Leader>h :TmuxNavigateLeft<cr>
" nnoremap <silent> <Leader>j :TmuxNavigateDown<cr>
" nnoremap <silent> <Leader>k :TmuxNavigateUp<cr>
" nnoremap <silent> <Leader>l :TmuxNavigateRight<cr>
" nnoremap <silent> <Leader> :TmuxNavigatePrevious<cr>

" Easy motion configs
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
        \   'converters': [incsearch#config#fuzzyword#converter()],
        \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
        \   'keymap': {"\<CR>": '<Over>(easymotion)'},
        \   'is_expr': 0,
        \   'is_stay': 1
        \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

set termguicolors
