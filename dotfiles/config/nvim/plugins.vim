let s:editor_root = '~/.config/nvim'
let s:plugin_path = s:editor_root . '/bundle'

call plug#begin(s:plugin_path)
	Plug 'alvan/vim-closetag'
	Plug 'burnettk/vim-angular'
	Plug 'ConradIrwin/vim-bracketed-paste'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
	Plug 'deoplete-plugins/deoplete-jedi', { 'do': 'python -m pip install -U jedi' }
	Plug 'dpc/vim-smarttabs'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'godoctor/godoctor.vim', { 'do': ':GoDoctorInstall' }
	Plug 'honza/vim-snippets'
	Plug 'huawenyu/neogdb.vim'
	Plug 'jacoborus/tender.vim'
	Plug 'janko-m/vim-test'
	Plug 'jremmen/vim-ripgrep'
	Plug 'junegunn/vader.vim'
	Plug 'junegunn/vim-easy-align'
	Plug 'kevinkjt2000/robotframework-vim'
	Plug 'kevinkjt2000/tmuxline.vim'
	Plug 'mhinz/vim-mix-format'
	Plug 'moll/vim-node'
	Plug 'nathanalderson/yang.vim'
	Plug 'nfvs/vim-perforce'
	Plug 'prettier/vim-prettier'
	Plug 'python-mode/python-mode'
	Plug 'sheerun/vim-polyglot'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'SirVer/ultisnips'
	Plug 'slashmili/alchemist.vim'
	Plug 'tpope/vim-abolish'
	Plug 'tpope/vim-bundler'
	Plug 'tpope/vim-dispatch'
	Plug 'tpope/vim-endwise'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-projectionist'
	Plug 'tpope/vim-rake'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'vim-scripts/groovyindent-unix'
	Plug 'w0rp/ale'
call plug#end()
