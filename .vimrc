" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible  "关闭vim一致性原则
filetype off
filetype plugin on
filetype indent on

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax enable 
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
  "filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" base setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd		    " Show (partial) command in status line.
set statusline=[%F]%y%r%m%*%=(%c,%l/%L)%p%%
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandonedset
set mouse=a		    " Enable mouse usage (all modes)
set foldenable      "允许折叠
"set foldmethod=marker "标志折叠
set foldmethod=indent "set default foldmethod
set foldlevelstart=99
set foldlevel=1 
"set nu              "显示行号
set ruler           " 显示标尺  
set cursorcolumn   "突出显示当前列
set cursorline      " 突出显示当前行"
set magic           " 设置魔术http://www.cnblogs.com/penseur/archive/2011/02/25/1964522.html
set laststatus=2    " 显示状态栏 (默认值为 1, 无法显示状态栏) "
set tabstop=4       " 设置制表符(tab键)的宽度"
set softtabstop=4   " 设置软制表符的宽度"
set shiftwidth=4    " (自动) 缩进使用的4个空格"
set expandtab
set autoindent
set notextmode
set hlsearch        "搜索高亮 ":nohlsearch
set wildmenu           " see :h 'wildmenu'
set wildignore=*.o,*~,*.pyc,*.swp,*.jpg,*png,*.gif,.svn " ignore these file complete
set wildmode=list:full " see :h 'wildmode' for all the possible values
set backspace=indent,eol,start " Configure backspace so it acts as it should act
"set whichwrap+=<,>,h,l
set lazyredraw " Don't redraw while executing macros (good performance config)
set history=700 " Sets how many lines of history VIM has to remember
set noswapfile " no swap files
set viminfo='100,n~/.viminfo
set splitbelow 
"set relativenumber " line number 
"set tags=./tags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle settingss
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set rtp+=/home/lz/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
"set rtp+=~/.vim/bundle/unite.vim/autoload/unite.vim
"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
call vundle#rc()
" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" theme molokai
Plugin 'tomasr/molokai'
" directory tree
Plugin 'scrooloose/nerdtree' 
" autocomplete utils
"Plugin 'Shougo/neocomplcache.vim'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'vim-scripts/EasyMotion'
Plugin 'easymotion/vim-easymotion'
" comment utils
Plugin 'scrooloose/nerdcommenter'
"结构体自动补全 snipmate 
Plugin 'msanders/snipmate.vim'
"符号对其 :Tab /:
"Plugin 'godlygeek/tabular'
"JavaScript bundle for vim, this bundle provides syntax and indent plugins.
"Plugin 'pangloss/vim-javascript'
"底栏
Plugin 'bling/vim-airline'
" about "surroundings": parentheses, brackets, quotes, XML tags
"Plugin 'tpope/vim-surround'
"html 标签补全 http://www.zfanw.com/blog/zencoding-vim-tutorial-chinese.html
Plugin 'mattn/emmet-vim'
"ack-grep or ag:silver searcher
Plugin 'mileszs/ack.vim'
"undo redo tree
Plugin 'mbbill/undotree'
"xdebug DBGPavim
Plugin 'brookhong/DBGPavim'
" document generator
Plugin 'vim-scripts/DoxygenToolkit.vim'
"start screen
Plugin 'mhinz/vim-startify'
"sublime text style multiple selections
"Plugin 'terryma/vim-multiple-cursors'
"Interactive command execution in Vim.
Plugin 'Shougo/vimproc.vim'
"Powerful shell implemented by vim.
"Plugin 'Shougo/vimshell.vim'
"Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'
"Unite and create user interfaces 
Plugin 'Shougo/unite.vim'
"MRU plugin includes unite.vim MRU sources
Plugin 'Shougo/neomru.vim'
"Vim plugin that displays tags in a window
Plugin 'majutsushi/tagbar'
"git control
Plugin 'tpope/vim-fugitive'
"注释增强
Plugin 'tomtom/tcomment_vim'
"在html中显示匹配的标签
"Plugin 'gregsexton/MatchTag'
"在html中按%跳转至对应的标签
Plugin 'vim-scripts/matchit.zip'
"ctrl+p 搜索文件，buffer
Plugin 'kien/ctrlp.vim' 
"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'
"php函数自动补全
"Plugin 'brookhong/neco-php' 
"顶部minibuf
"Plugin 'fholgado/minibufexpl.vim'
" snips which needs python and python3
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"底栏
"Plugin 'Lokaltog/vim-powerline'
"taglist
"Plugin 'kylinwowo/taglist'
"phpcomplete
Plugin 'shawncplus/phpcomplete.vim'
"php manual
"Plugin 'alvan/vim-php-manual'
"Plugin 'adoy/vim-php-refactoring-toolbox'
"Plugin 'joonty/vim-phpqa'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" base key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","   " 指定英文逗号作为<leader>键
let g:mapleader=","   " 指定英文逗号作为<leader>键
" Fast saving
nmap <leader>w :w!<cr>
"nmap <leader>q :q<cr>
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <C-;> ;
"buffer next and pre
nmap <leader>n :bn<cr>
nmap <leader>p :bp<cr>
nmap <leader>tn :tabNext<cr>
nmap <leader>tp :tabprevious<cr>

"leader toggles
"nmap <leader>tt :TlistToggle<cr>
function! ToggleTree()
    ":MBEClose
    :NERDTreeToggle
    ":MBEOpen
endfunction
nmap <leader>nt :call ToggleTree()<cr>
nmap <leader>tt :TagbarToggle<cr>
nmap <leader>ut :UndotreeToggle<cr>
nmap <leader>bu :Unite buffer<cr>

"easymotion ------------start-------------
let g:EasyMotion_leader_key = '<Leader>'
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map  <Leader><space> <Plug>(easymotion-sn)
omap <Leader><space> <Plug>(easymotion-tn)
"easymotion  ----------end---------------

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" theme setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
color molokai 
let g:molokai_original = 1
let g:rehash256 = 1
set ts=4
set shiftwidth=4
hi CursorLine ctermbg=233  cterm=NONE  ctermfg=NONE
"hi CursorLine term=underline cterm=underline ctermbg=NONE 
hi Visual     term=reverse ctermbg=236 guibg=#403D3D
"背景透明
hi Normal     ctermbg=none 

let g:airline_powerline_fonts = 1

""""""""""""""
"  DBGPavim  "
""""""""""""""
"let g:dbgPavimPort = 9089
let g:dbgPavimPort = 10000
let g:dbgPavimBreakAtEntry = 0 

""""""""""""""""""""
"  DoxygenToolkit  "
""""""""""""""""""""
"let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
"let g:DoxygenToolkit_paramTag_pre="@Param "
"let g:DoxygenToolkit_returnTag="@return "
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="cyleung"
let g:DoxygenToolkit_licenseTag="license" 

let g:snips_author="cyleung"

"map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>

"my vim settings

"""""""""
"  ack  "
"""""""""
let g:ackprg = "ack-grep"

""""""""""""""""""""""""""""""
" nerdtree setting
""""""""""""""""""""""""""""""
let NERDChristmasTree=1       "显示增强
let NERDTreeDirArrows=0
let NERDTreeAutoCenter=1      "自动调整焦点
let NERDTreeMouseMode=2       "鼠标模式:目录单击,文件双击
"let NERDTreeQuitOnOpen=1      "打开文件后自动关闭
let NERDTreeShowFiles=1       "显示文件
"let NERDTreeShowHidden=1      "显示隐藏文件
let NERDTreeHightCursorline=1 "高亮显示当前文件或目录
let NERDTreeWinPos='left'     "窗口位置
let NERDTreeWinSize=31        "窗口宽度
"let NERDTreeShowBookmarks = 1
"let NERDTreeMinimalUI=1 "不显示'Bookmarks' label 'Press ? for help'
"let NERDTreeIgnore = ['\.pyc$']

"undo tree setting
let g:undotree_WindowLayout = 4
set undodir=~/.vim/.undodir/
set undofile

"ctrlp settings
let g:ctrlp_working_path_mode = 'w'

""""""""""""""""""""""""""""""
" others setting
""""""""""""""""""""""""""""""
let &termencoding=&encoding
set fileencodings=utf-8,gbk
let g:DirDiffExcludes = "system,CVS,*.class,*.exe,.svn,*.swp,/data/,/template/" 


""airline setting
let g:airline_theme = "lucius" "设定主题
let g:airline#extensions#whitespace#checks = [  ]
"let g:airline_detect_whitespace          = 0 "关闭空白符检测
let g:airline#extensions#tabline#enabled = 1 "顶部tab栏显示
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline_theme = "hybrid" "设定主题
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

""let g:airline#extensions#tabline#buffer_nr_format = '%s: '
""let g:airline#extensions#tabline#fnamecollapse = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'
""let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" old vim-powerline symbols
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

"搜索时把当前结果置于屏幕中央并打开折叠
nnoremap n nzzzv
nnoremap N Nzzzv

"翻转; 和 :
nnoremap ; :
"nnoremap : ;

"unite
"nnoremap <C-l> :Unite file file_rec file_mru buffer -quick-match -auto-preview -start-insert <CR>
"nnoremap <C-P> :Unite file file_rec file_mru buffer  -auto-preview   <CR>
let g:unite_source_history_yank_enable = 1
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='» '
let g:unite_source_grep_default_opts = '-i --exclude ''\.(git|svn|hg|bzr|swp|jpg|png|gif)$'
let g:unite_split_rule = 'botright'
""nnoremap <silent> <c-p> :Unite -auto-preview  -auto-resize file file_mru file_rec <cr>
""nnoremap <silent> <c-p> :Unite  -auto-resize file file_mru file_rec <cr>
"nnoremap <silent> <C-p> :Unite -start-insert -buffer-name=files -winheight=10 file_rec<cr>
"nnoremap <silent> <Leader>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>
"nnoremap <Leader>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>
"
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec/async','sorters','sorter_rank')
"
"
call unite#custom#source('file,file/new,buffer,file_rec','matchers', 'matcher_fuzzy')
call unite#custom#source('file,file/new,buffer,file_rec','matchers', 'matcher_fuzzy')
call unite#custom#profile('default', 'context', { 'prompt_direction': 'bellow' })
let g:unite_enable_split_vertically = 1

let g:startify_custom_header = [
    \ ' ██████╗██╗   ██╗    ██╗     ███████╗██╗   ██╗███╗   ██╗ ██████╗ ',
    \ '██╔════╝╚██╗ ██╔╝    ██║     ██╔════╝██║   ██║████╗  ██║██╔════╝ ',
    \ '██║      ╚████╔╝     ██║     █████╗  ██║   ██║██╔██╗ ██║██║  ███╗',
    \ '██║       ╚██╔╝      ██║     ██╔══╝  ██║   ██║██║╚██╗██║██║   ██║',
    \ '╚██████╗   ██║██╗    ███████╗███████╗╚██████╔╝██║ ╚████║╚██████╔╝',
    \ ' ╚═════╝   ╚═╝╚═╝    ╚══════╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ',
    \ '']

let g:startify_custom_footer = [
    \ '                                                                   ',
    \ '                                                                   ',
    \ '(¯`·._.·(¯`·._.·(¯`·._.· Vim save my life ·._.·´¯)·._.·´¯)·._.·´¯) ',
    \ '                                                                   ',
    \ '                                                                   ',
    \ '                                                                   ',
    \ '                  .__....._             _.....__,                  ',
    \ '                    .": o :":         ;": o :".                    ',
    \ '                    `. `-" .".       .". `-" ."                    ',
    \ '                      `---"             `---"                      ',
    \ '                                                                   ',
    \ '            _...----...      ...   ...      ...----..._            ',
    \ '         .-"__..-"""----    `.  `"`  ."    ----"""-..__`-.         ',
    \ '        ".-"   _.--""""       `-._.-"       """"--._   `-.`        ',
    \ '        "  .-""                  :                  `"-.  `        ',
    \ '          "   `.              _."""._              ."   `          ',
    \ '                `.       ,.-""       ""-.,       ."                ',
    \ '                  `.                           ."                  ',
    \ '                    `-._                   _.-"                    ',
    \ '                        `""--...___...--""`                        ',
    \ ''] 

set grepprg=ack-grep\ -a\ --nocolor           

""""""""""""""""""
"  quich search  "
""""""""""""""""""
"let g:ackprg = 'ag --nogroup --nocolor  --nogroup --column'
"let g:ackprg = 'ag --nogroup --column -S'
let g:ackprg = 'ag --nogroup --nocolor --column -S'

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
            \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
            \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

""""""""""""""""""""""""""""""
"startify 
""""""""""""""""""""""""""""""
"let g:startify_list_order = [
    "/['My sessions:'],
    "/'sessions', 
    "/['Bookmarks(vimrc settings):'],
    "/'bookmarks',
    "/['rectently files:'],
    "/'files', 
    "/['recently dirs:'],
    "/'dir',]
"let g:startify_bookmarks = [ '~/.vim/vimrc' , '~/www/oa/index.php', '~/www/doc/index.md', '~/workspace/cron/deamon.php' ]
" When opening a file or bookmark, change to its directory.
let g:startify_change_to_vcs_root = 1
" A list of Vim regular expressions that filters recently used files.
let g:startify_skiplist = ['\.svn-base', ]


""""""""""""""""""""""""""""""
" ultisnips
""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
autocmd BufNewFile,BufRead *.snippets set filetype=snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:ycm_server_keep_logfiles = 1

"autocmd Filetype python :UltiSnipsAddFiletypes python
"autocmd Filetype c :UltiSnipsAddFiletypes c
"autocmd Filetype cpp :UltiSnipsAddFiletypes cpp
"autocmd Filetype php :UltiSnipsAddFiletypes php
"autocmd Filetype html :UltiSnipsAddFiletypes html
"autocmd Filetype sh :UltiSnipsAddFiletypes sh
" " If you want :UltiSnipsEdit to split your window.
 let g:UltiSnipsEditSplit="vertical"

 """""""""""""""""
 "  git control  "
 """""""""""""""""
"Auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd QuickFixCmdPost *log* cwindow

""""""""""""""""""
"  syntax check  "
""""""""""""""""""
let g:syntastic_php_checkers = ['php32', 'phpcs', 'phpmd', 'phplint']
let g:syntastic_php_checkers = ['php']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = [".*\.html$"] "忽略html语法检查
"let g:syntastic_ignore_files = [".*\.htm$"] "忽略html语法检查
"""""""""""""""""""""""""
"let g:syntastic_error_symbol='>>'
"let g:syntastic_warning_symbol='>'
"let g:syntastic_check_on_open=1
"let g:syntastic_check_on_wq=0
"let g:syntastic_enable_hignlighting=1

""""""""""""""""""""""""
"  php smart complete  "
""""""""""""""""""""""""
"let g:phpcomplete_add_class_extensions = ['mongo']
"let g:phpcomplete_add_function_extensions = ['mongo']
"let g:phpcomplete_parse_docblock_comments = 1 "not working...
let g:phpcomplete_search_tags_for_variables = 1
"let g:phpcomplete_complete_for_unknown_classes = 1
"let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_cache_taglists = 1
let g:phpcomplete_enhance_jump_to_definition = 1
let g:phpcomplete_mappings = { 'jump_to_def': ',g', }
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
set omnifunc=phpcomplete#CompletePHP
""""""""""""""""""""""
"  ycm autocomplete  "
""""""""""""""""""""""
"let g:ycm_semantic_triggers =  { 'c' : ['->', '.'] }
"let g:ycm_auto_trigger = 0
" ################### 自动补全 ###################
"
" 代码自动补全
" 迄今为止用到的最好的自动VIM自动补全插件
" 重启 :YcmRestartServer
" Bundle 'Valloric/YouCompleteMe'
" youcompleteme  默认tab  s-tab 和自动补全冲突
 let g:ycm_key_list_select_completion=['<c-n>']
" let g:ycm_key_list_select_completion = ['<Down>']
 let g:ycm_key_list_previous_completion=['<c-p>']
" let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
" let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
 let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
 let g:ycm_collect_identifiers_from_comments_and_strings = 1
" "注释和字符串中的文字也会被收入补全
 let g:ycm_collect_identifiers_from_tags_files = 1
"
let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全,
" 不过python关键字都很短，所以，需要的自己打开
"
" 跳转到定义处, 分屏打开
"let g:ycm_goto_buffer_command = 'horizontal-split'
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
 nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
 nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

" new version
  if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
     let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
  endif
"
" 直接触发自动补全 insert模式下
"let g:ycm_key_invoke_completion = '<C-Space>'
"         " 黑名单,不启用
" let g:ycm_filetype_blacklist = {
"     \ 'tagbar' : 1,
"     \ 'gitcommit' : 1,
"     \}
"""""""""""""
"  minibuf  "
"""""""""""""
"let g:miniBufExplVSplit=25
"let g:miniBufExplBRSplit=0

"""""""""""""""""""""""""""
"  auto update tags file  "
"""""""""""""""""""""""""""
function! DelTagOfFile(file)
    let fullpath = a:file
    let cwd = getcwd()
    let tagfilename = cwd . "/tags"
    let f = substitute(fullpath, cwd . "/", "", "")
    let f = escape(f, './')
    let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
    let resp = system(cmd)
endfunction

function! UpdatePHPTags()
    let f = expand("%:p")
    let cwd = getcwd()
    let tagfilename = cwd . "/tags"
    let cmd = 'ctags -R  --fields=+aimS  --languages=php &'
    call DelTagOfFile(f)
    let resp = system(cmd)
endfunction
autocmd BufWritePost *.php call UpdatePHPTags()


let g:phpqa_php_cmd='/usr/local/php/bin/php'
let g:phpqa_codesniffer_cmd='/usr/local/php/bin/phpcs'
let g:phpqa_messdetector_cmd='/usr/local/php/bin/phpmd'
let g:phpqa_codecoverage_file = "/tmp/clover.xml"
" Show markers for lines that ARE covered by tests (default = 1)
let g:phpqa_codecoverage_showcovered = 0

let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_codecoverage_autorun = 0
" emmet 
"let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_leader_key="<c-y>"

