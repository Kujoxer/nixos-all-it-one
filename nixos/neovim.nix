{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true; 
    defaultEditor = true;
    configure = {
      customRC = ''
        let mapleader = " "
        let maplocalleader = " "
        let g:have_nerd_font = 1
        set number
        set relativenumber
        set mouse=a
        set noshowmode
        autocmd UiEnter * set clipboard=unnamedplus
        set breakindent
        set undofile
        set ignorecase
        set smartcase
        set signcolumn=yes
        set updatetime=250
        set timeoutlen=300
        set splitright
        set splitbelow
        set list
        set listchars=tab:»\ ,trail:·,nbsp:␣
        set inccommand=split
        set cursorline
        set scrolloff=10
        set expandtab
        set shiftwidth=2
        set tabstop=2
        nnoremap <Esc> :nohlsearch<CR>
        nnoremap <leader>q :lua vim.diagnostic.setloclist()<CR>
        nnoremap <C-h> <C-w>h
        nnoremap <C-l> <C-w>l
        nnoremap <C-j> <C-w>j
        nnoremap <C-k> <C-w>k
        tnoremap <Esc><Esc> <C-\><C-n>
        augroup kickstart-highlight-yank
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
        augroup END
        ''; 

      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [ fugitive ];
        opt = [ ];
      };
    };
  };
}
