"|-|-|-|-|-| Vim Plug |-|-|-|-|-|
call plug#begin(stdpath('data') . '/plugged')

" CoC Intellisense engine for Neovim.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets support.
Plug 'SirVer/ultisnips'

" NERDTree File Manager.
Plug 'preservim/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Vim Commentary
Plug 'tpope/vim-commentary'

" Syntax for most languages.
Plug 'sheerun/vim-polyglot'

" Dracula theme.
Plug 'dracula/vim'

" Airline (bottom line Vim).
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Rainbow Parenthesis.
Plug 'luochen1990/rainbow'

call plug#end()

"|-|-|-|-|-| Vim Rainbow Parenthesis configuration |-|-|-|-|-|"
let g:rainbow_active = 1

"|-|-|-|-|-| Vim DevIcons configuration |-|-|-|-|-|"
" Removes [ in front of the first directory
let g:rainbow_conf = {
\    'separately': {
\       'nerdtree': 0
\    }
\}

"|-|-|-|-|-| Vim UltiSnips configuration |-|-|-|-|-|"
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<C-p>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"|-|-|-|-|-| Vim Airline configuration |-|-|-|-|-|"
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_symbols_ascii = 1

"|-|-|-|-|-| Vim NERDTree configuration |-|-|-|-|-|"
let NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

"|-|-|-|-|-| Vim Coc configuration |-|-|-|-|-|"
" Some servers have issues with backup files.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-space> (Ctrl-space) to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use <CR> (Enter) to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"|-|-|-|-|-| Vim syntax colors |-|-|-|-|-|"
" Enabling true colors in terminal.
set termguicolors

" Enable syntax colors.
syntax on

" Set Dracula as colorscheme.
colorscheme dracula

" Set Airline Dracula theme.
let g:airline_theme = 'dracula'

" Transparency on Vim.
hi Normal guibg=NONE ctermbg=NONE

"|-|-|-|-|-| Vim extras |-|-|-|-|-|"

" Hybrid numbers based on cursor position and current line.
set number relativenumber

set smarttab
set cindent

" Tab spacing set to 4 spaces.
set shiftwidth=4
set tabstop=4 

" Tab set as spaces.
set expandtab

" Removing line wrap.
set nowrap

" Adding a ruler (limiting lines to 100 letters).
" set colorcolumn=100

" Setting default split to right and below.
set splitright
set splitbelow

" Vim yank copy to clipboard (super useful).
set clipboard=unnamedplus

" Vim menu when saving without writing
set confirm

" Vim mouse enabling
set mouse=a

" Set title on tiling window managers
set title

autocmd FileType javascript      call SetTwoSpacesTab()
autocmd FileType javascriptreact call SetTwoSpacesTab()
autocmd FileType json            call SetTwoSpacesTab()

" If last window open is NERDTree, close it
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function SetTwoSpacesTab()
    set shiftwidth=2
    set tabstop=2
endfunction

" Doesn't show return status
autocmd TermClose * :q

"|-|-|-|-|-| Vim maps |-|-|-|-|-|"
" NERDTree Toggle.
map <C-n> :NERDTreeToggle<CR>

" NERDTree Refresh.
map <C-x> :NERDTreeRefreshRoot<CR>

" Leader key to Space
let g:mapleader = " "

" hjkl to jklç.
noremap ç l
noremap l k
noremap k j
noremap j h

noremap <C-w>ç <C-w>l
noremap <C-w>l <C-w>k
noremap <C-w>k <C-w>j
noremap <C-w>j <C-w>h

" Buffer navigation (integrates great with Airline)
noremap J :bNext<CR>
noremap Ç :bnext<CR>

inoremap <C-w> <Esc><C-w>

" shortening keystrokes
noremap q :Kwbd<CR>
noremap Q :quit!<CR>
tnoremap Q <C-\><C-n>:quit!<CR>

noremap <C-s> :write<CR>
inoremap <C-s> <Esc>:write<CR>a

noremap O :enew<CR>
nnoremap hl :nohl<CR>

" Terminal <C-\><C-n> to <Esc>.
tnoremap <Esc> <C-\><C-n>

" Navigation map in terminal.
tnoremap <C-w>w <C-\><C-n><C-w>w

" Control + T keystroke toggle a bottom terminal.
nnoremap <C-t> :call TermToggle()<CR>
inoremap <C-t> <Esc>:call TermToggle()<CR>
tnoremap <C-t> <C-\><C-n>:call TermToggle()<CR>

let g:term_buf = 0
let g:term_win = 0

function! TermToggle()
    if win_gotoid(g:term_win)
        hide
    else
        split new
        resize -5
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

function s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(&modified)
      let answer = confirm("This buffer has been modified. Are you sure you want to delete it?", "&Yes\n&No", 2)
      if(answer != 1)
        return
      endif
    endif
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! Kwbd :call s:Kwbd(1)
