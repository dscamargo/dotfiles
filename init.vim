set nocompatible
filetype off

set wildignore+=**/node_modules/*
set wildmenu

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-prettier'
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-tsserver'
Plug 'ryanoasis/nerd-fonts'
Plug 'alvan/vim-closetag'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'rstacruz/vim-hyperstyle'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'styled-components/vim-styled-components'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'maxmellon/vim-jsx-pretty'

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

syntax enable

packadd! dracula_pro

command! -nargs=0 Prettier :CocCommand prettier.formatFile

autocmd BufWritePost * :CocCommand prettier.formatFile

set guifont="JetBrainsMono Nerd Font:h14"
set number
set relativenumber
set background=dark
set mouse=a

set clipboard=unnamedplus

" Buffer Highlight
syntax sync fromstart
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" coc.vim config
set hidden
set cmdheight=2
set updatetime=300

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" Dracula PRO
let g:dracula_colorterm=0
colorscheme dracula_pro

let mapleader=" "
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fg :Telescope git_files<cr>
nnoremap <C-o> :NERDTreeToggle <cr>
nnoremap <C-s> :w <cr>

" NerdTree Configs
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowLineNumbers = 1
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 38


map <leader>n :tabnew<CR>          " create a new tab

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.tsx"

let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-json']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
 let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif
