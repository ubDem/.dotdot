" -----------------------------------------------------------------------------
" Dependencies 
" -----------------------------------------------------------------------------
" Python
" " neovim-remote
" " pynvim Perl
" TexLive
" Latexmk
" nodejs
" npm
" (With CoC's own package manager)
" " coc-vimtex
" " coc-snippets
"# Zathura
"
" TODO: Explore the native code completion

filetype on
filetype plugin indent on
set nocindent 
set nosmartindent
set noautoindent
set textwidth=80

set nocompatible
let &rtp = '~/.vim/bundle/vimtex,' . &rtp
let &rtp = '~/.vim/bundle/vim-tex-fold,' . &rtp
let &rtp .= ',~/.vim/bundle/vimtex/after'
filetype plugin indent on
syntax enable


set encoding=UTF-8
" For YATS
set re=0

set so=30

" Python runs in a nice conda-env
let g:python3_host_prog = '~/anaconda/envs/vim/bin/python'


" -----------------------------------------------------------------------------
" VIM_PLUG
"  ----------------------------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')

" BIGBOIS
" -----------------------------------------------------------------------------

" Semantic completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Latex
Plug 'lervag/vimtex'
" Full Conceal for Latex
Plug  'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

" Snippets
Plug 'SirVer/ultisnips'
" " Ready to use snippets
Plug 'honza/vim-snippets'

" Syntax check
Plug 'dense-analysis/ale'

" Paired brackets
Plug 'jiangmiao/auto-pairs'

" Comment lines
Plug 'scrooloose/nerdcommenter'

" Auto-format code
Plug 'sbdchd/neoformat'

" Jedi for python
Plug 'davidhalter/jedi-vim'

" Code checker
Plug 'neomake/neomake'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Fold
Plug 'tmhedberg/SimpylFold'

" RMarkdown
" -----------------------------------------------------------------------------
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'conornewton/vim-pandoc-markdown-preview'

" Supplementary 
" -----------------------------------------------------------------------------

" Colorscheme
Plug 'ajmwagar/vim-deus'
Plug 'gruvbox-community/gruvbox'
Plug 'dylanaraps/wal'
Plug 'arcticicestudio/nord-vim'
" Syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

"Plug 'nvim-treesitter/nvim-treesitter'

"Indentation Lines (didn't work as intended)
"Plug 'Yggdroot/indentLine'

" Airline Status-Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Better Navigation
Plug 'scrooloose/nerdtree'

"Higlight the yanked 
Plug 'machakann/vim-highlightedyank'

"Fancy Start
Plug 'mhinz/vim-startify'

" Icons for NERDTree
Plug 'ryanoasis/vim-devicons'

" Better reading/writing mode
Plug 'junegunn/goyo.vim'

call plug#end()

"----------------------------------------------------------------------------
" Pure VIM-Settings
"
"----------------------------------------------------------------------------

" use 4 spaces for tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

" Set linenumbers
set number
set relativenumber
set wrap

" Splits open on the right or below
set splitbelow splitright

set nocompatible
filetype plugin on

" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1
" Enable folding with the spacebar
nnoremap <space> za

" Paste without indentation
set pastetoggle=<F3

"----------------------------------------------------------------------------
"  KEY MAPPINGS
"----------------------------------------------------------------------------

" Execute python-script
imap <F5> <Esc>:w<CR>:!python %<CR>

" Ale lints key mapping
nnoremap <C-Right> :lnext<CR>
nnoremap <C-Left>  :lprevious<CR>
nnoremap <C-Up> :lrewind<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" -----------------------------------------------------------------------------
" ULTI-SNIPS
" -----------------------------------------------------------------------------

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" -----------------------------------------------------------------------------
" Color scheme settings
"  ----------------------------------------------------------------------------

"set termguicolors
"colorscheme deus
colorscheme wal
set background=dark

" NORD settings
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1

" -----------------------------------------------------------------------------
" VimTex
" -----------------------------------------------------------------------------
let g:tex_flavor='latex'
"let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'

" Callbacks aka backwards or reverse search (from pdfviewer to tex file)
let g:vimtex_compiler_progname = 'nvr'

" Well, let's try the full conceal
set conceallevel=2
let g:tex_conceal="abdgm"

" toc settings
let g:vimtex_toc_config = {
    \ 'mode' : 2,
    \ 'fold_enable' : 1,
    \ 'hotkeys_enabled' : 1,
    \ 'hotkeys_leader' : '',
    \ 'split_pos' : 'vert rightbelow',
    \ 'split_width' : 50,
    \}

let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
    
let VimtexTocToggle = 0

let g:latex_indent_enabled = 0

" -----------------------------------------------------------------------------
" Stata
" -----------------------------------------------------------------------------
let g:vimforstata_pathbin = "/usr/local/stata16/xstata"

" -----------------------------------------------------------------------------
" CoC
" -----------------------------------------------------------------------------


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='wal'

"-----------------------------------------------------------------------------
" IntendLine
"-----------------------------------------------------------------------------
"let g:indentLine_setColors = 0
"let g:indentLine_setConceal = 0
"let g:indentLine_faster     = 1
"let g:indentLine_char = '▏'

"-----------------------------------------------------------------------------
" NERDTree  
"----------------------------------------------------------------------------
"cd ~/
map <F2> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline = 0
set lazyredraw
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"-----------------------------------------------------------------------------
" Devicons  
"----------------------------------------------------------------------------
" loading the plugin
let g:webdevicons_enable = 1

" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1

" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

" adding to vim-startify screen
"let g:webdevicons_enable_startify = 1

" whether or not to show the nerdtree brackets around flags
"let g:webdevicons_conceal_nerdtree_brackets = 1

let g:md_pdf_viewer="Zathura"


"-----------------------------------------------------------------------------
" Jedi  
"----------------------------------------------------------------------------

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

"-----------------------------------------------------------------------------
" NeoMake  
"----------------------------------------------------------------------------

let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)

"-----------------------------------------------------------------------------
" Highlightedyank  
"----------------------------------------------------------------------------

hi HighlightedyankRegion cterm=reverse gui=reverse
" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000


"-----------------------------------------------------------------------------
" Python Terminal  
"----------------------------------------------------------------------------


nnoremap <C-R> :sp <CR> :term python % <CR>
nnoremap <C-W> :bd!<CR>
