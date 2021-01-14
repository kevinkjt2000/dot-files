" Forget the past, the future is not compatible with it
set nocompatible

" Load plugins first :)
{%@@ include 'config/nvim/plugins.vim' @@%}

{%@@ include 'config/nvim/airline.vim' @@%}
{%@@ include 'config/nvim/mappings.vim' @@%}

" Disable prettier default autoformat
let g:prettier#autoformat = 0
" Automatically format some filetypes with prettier
autocmd BufWritePre *.cjs,*.js,*.jsx,*.yaml,*.yml,*.ts,*.tsx,*.css,*.scss PrettierAsync

" Some python ropeproject settings
let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_goto_definition_cmd = 'e'

" Disable pymode linting, since ALE handles that
let g:pymode_lint = 0

" Automatically reload vimrc when it is saved
augroup reload_vimrc
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" Automatically turn off line numbers in terminal mode
augroup no_terminal_line_numbers
	autocmd!
	autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" Cool colors!! (requires a 24-bit terminal)
set termguicolors
syntax enable
silent! colorscheme tender

" ALE options
let g:ale_fixers = {
\   'python': ['black'],
\}
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'cpp': ['clang', 'g++'],
\   'haskell': ['ghc'],
\   'python': ['flake8', 'pylint'],
\   'typescript': ['eslint'],
\}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Newer versions of GHC require linking dynamically now on Arch
let g:ale_haskell_ghc_options = '-dynamic'

" Fix https://github.com/phoenixframework/phoenix/issues/1165
augroup AleGroup
	autocmd!
	autocmd User ALELint call TouchOpenFile()
augroup END

func! TouchOpenFile()
	if &ft == 'elixir'
		let g:ale_enabled = 0
		sleep 500m
		w
		let g:ale_enabled = 1
	endif
endfunc

" Configure vim-closetag to also work for languages like ruby and elixir
let g:closetag_filenames = '*.html,*.eex,*.erb'

" Close any <tag> with </tag> in these files (even tags like <br>)
let g:closetag_xhtml_filenames = '*.xml,*.xhtml,*.jsx'

" Automatically format elixir files
let g:mix_format_on_save = 1
let g:mix_format_options = '--check-equivalent'

" It is nice to have the mouse working
set mouse=a

" Set to auto read when a file is changed from the outside
set autoread

" Default indentation settings that are overriden by .editorconfig files
filetype plugin indent on       " load filetype-specific indent files
set shiftwidth=2
set tabstop=2
set softtabstop=0
set noexpandtab
set smarttab
set autoindent
set smartindent

" Configure invisible character alternates
set listchars=tab:>-,extends:>,precedes:<

set number                      " Show line numbers
set showcmd                     " Show command in bottom bar
set cursorline                  " Highlight current line
set wrap                        " Wrap lines

set wildmenu                    " Visual autocompete for command menu
set wildmode=list:longest       " Make <TAB> complete only up the point of ambiguity
set wildignore+=*.o,*~,*.pyc    " Ignore some files
set wildignore+=*/.DS_Store/*

set lazyredraw     " Don't redraw while executing macros (good performance config)

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

set showmatch      " Highlight matching [{()}]

set ignorecase     " Ignore case when searching
set smartcase      " When searching try to be smart about cases
set incsearch      " Search as characters are entered
set hlsearch       " Highlight matches

set nofixendofline " Don't automatically add a new line to the end of files

if executable('rg')
	set grepprg=rg\ --no-heading
	let g:ctrlp_user_command = 'rg %s -g "" --files'
endif

set foldenable
set foldlevelstart=10           " Open most folds by default
set foldnestmax=10              " Guards against too many folds
set foldmethod=indent           " Fold based on indent level

" Disable backups as I save enough anyway
set nobackup
set nowritebackup

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Show lines of context near edges when scrolling up and down
set scrolloff=3

" Enable per-directory .vimrc files
set exrc
set secure

" Allow switching buffers without writing to disk
set hidden
