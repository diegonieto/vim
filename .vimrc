set hls
set background=dark
set nu
set smartcase
set expandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set autoindent
set smartindent
set cursorline
set incsearch
set foldenable
set ic
:hi CursorLine   cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

"Find functions
command Funcs execute "/\\w\\+ \\w\\+ *(.*)\\n{"
map <F5> :Funcs<CR>

"Find class member functions
command Methods execute "/\w* *\\w\\+::\\w\\+(.*)"
map <F6> :Methods<CR>

au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
"au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=syntaxcomplete#Complete

" CTags!
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/qt_tags
" build tags of your own project with Ctrl-F11
map <C-F11> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q --exclude=obj.* .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

set nocp
filetype plugin on

autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

source ~/.vim/autoload/a.vim
map <F2> :AV<CR>

map <C-e> :BufExplorer<CR>
