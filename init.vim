"  _   _                            _       _   _                 _           
" | | | | __ _ _ ____   _____ _   _( )___  | \ | | ___  _____   _(_)_ __ ___  
" | |_| |/ _` | '__\ \ / / _ \ | | |// __| |  \| |/ _ \/ _ \ \ / / | '_ ` _ \ 
" |  _  | (_| | |   \ V /  __/ |_| | \__ \ | |\  |  __/ (_) \ V /| | | | | | |
" |_| |_|\__,_|_|    \_/ \___|\__, | |___/ |_| \_|\___|\___/ \_/ |_|_| |_| |_|
"                             |___/                                           

" ===
" === 安装 neovim "
" ===
" git clone https://github.com/neovim/neovim.git
" cd neovim/
" git checkout release-0.4
" make CMAKE_BUILD_TYPE=RelWithDebInfo
" sudo make install
"

" ===
" === 安装plug "
" ===
" echo 'cacert=/etc/ssl/certs/ca-certificates.crt' > ~/.curlrc
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" echo 'cacert=/etc/ssl/certs/ca-certificates.crt' > ~/.curlrc
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"

" ===
" === 第一次运行自动加载配置
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'dyng/ctrlsf.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer',  'for': ['c', 'cpp'] }
" 若安装失败请用以下步骤尝试 "
" rm ~/.vim/bundle/YouCompleteMe -rf
" git clone https://gitee.com/mirrors/youcompleteme.git
" mv youcompleteme YouCompleteMe
" cd YouCompleteMe/
" python3 install.py --clang-completer
" 若提示错误：git submodule update --init --recursive
" 若遇到third_party/ycmd/third_party/go/src/golang.org/x/tools因谷歌无法访问报错
" cd third_party/ycmd/third_party/go/src/golang.org/x/
" rm tools/
" git clone https://github.com/golang/tools.git
" cd YouCompleteMe/
" git submodule update --init --recursive继续sync
" sync完毕后，继续尝试编译 python3 install.py --clang-completer
" 若遇到YouCompleteMe/third_party/ycmd/third_party/cregex" does not appear to contain CMakeLists.txt."此错误
" rm -rf YouCompleteMe/third_party/ycmd/third_party/cregex
" git submodule update --init --recursive
" 继续重编python3 install.py --clang-completer
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'kien/rainbow_parentheses.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/echodoc.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let mapleader=','				"设置Leader键为,"

func NvimBaseSetting()
    set number						"显示行号"
    set relativenumber

	filetype plugin indent on		"打开文件类型检查以及相关插件"

	set backspace=indent,eol,start	"使能backspace"

	syntax on						"语法高亮"

    set tabstop=4					"tab转4个空格"
    set softtabstop=4
    set shiftwidth=4				"缩进宽度为4个空格"
	set expandtab

	set autoindent					"自动缩进"
	set smartindent					"智能缩进"
	set smarttab					"行首插入空格"

	set cindent						"C语言自动对齐"

	set showmatch					"显示匹配括号"

	set hlsearch					"搜索高亮"
	set ignorecase					"搜索忽略大小写"
	set smartcase
	set incsearch

	set mouse=n						"鼠标不可用，便于使用shell复制粘贴"

	set fileencodings=utf-8			"文件支持编码"

    set history=1000                "保留1000条历史记录"

	set autoread                	"当文件在其他地方被更改时，自动重新加载"

    set wildmenu                	"命令行补全"

    set ruler                   	"显示光标位置"

    set cmdheight=5             	"命令行高度"

    set noerrorbells            	"关闭提示音"
    set novisualbell
	
	set scrolloff=5					"滚动底下保留5行"
	
	set wrap                    	"长行回绕"

    set linespace=2             	"行距"

    set foldmethod=marker       	"开启代码折叠"

	set showcmd						"显示输入命令"

	colorscheme snazzy				"主题"
	
	"分屏窗口大小调整"
    nnoremap <c-up> <c-w>-
    nnoremap <c-down> <c-w>+
    nnoremap <c-left> <c-w><
    nnoremap <c-right> <c-w>>
	
	"窗口移动"
	nnoremap <c-h> <c-w>h
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-l> <c-w>l
	
	"标签页操作"
	nnoremap <leader>ta :tabe		"打开标签页"
    nnoremap <leader>tq :tabc<CR>	"关闭标签页"
    nnoremap <S-t> gT				"切换标签页"
	
	"分屏"
	nnoremap <leader>wh :sp<CR>
    nnoremap <leader>wv :vsp<CR>
    nnoremap <S-w> <C-w>w<CR>"

	"新分屏的位置"
	set splitright
	set splitbelow
	
	"显示所在行列"
	set cursorcolumn
    set cursorline
	
	"..."
	set autochdir
	let &t_ut=''
	set viewoptions=cursor,folds,slash,unix
	set tw=0
	set indentexpr=
	set formatoptions-=tc

	"折叠代码"
	set foldmethod=indent
	set foldlevel=99
	set foldenable
	nnoremap <Leader>[ zc
    nnoremap <Leader>] zo

	"拼写检查"
	"发现有拼写错误时, z=选择词汇进行修正，忘记怎么拼可以ctrl+x进行提示"
	nnoremap <Leader> <space> : set spell!<CR>

    "=== coc base ===
    set hidden
    set updatetime=300
    set shortmess+=c
    set signcolumn=yes

endfunc

func PlugSetting()

"=== airline ===
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#formatter = 'default'

"=== auto-pairs ===
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

"=== fzf ===
"<Leader>f在当前目录搜索文件
nnoremap <silent> <Leader>f :Files<CR>
"<Leader>b切换Buffer中的文件
nnoremap <silent> <Leader>b :Buffers<CR>

"=== undotree ===
nnoremap <F1> :UndotreeToggle<cr>

"=== ctags ===
" 依赖于ctags
nnoremap <F5> :!ctags -R --languages=c,c++<cr>

"=== ctrlsf ===
" 依赖于 ag（the_silver_searcher）
nnoremap <Leader>g :CtrlSF -I -R<CR>
let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \}
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_populate_qflist = 1
let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_winsize = '30%'

"=== tagbar ===
nnoremap <F3> :TagbarToggle<CR>

"=== nerdtree ===
"nnoremap <F2> :NERDTreeToggle<CR>
" 打开nvim自动打开nerdtree
" autocmd vimenter * NERDTree

" 仅当没有指定文件时打开
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" 当打开目录时
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" 当只剩nerdtre窗口时，关闭nvim
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"=== nerdtree-git-plugin ===
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"=== vim-nerdtree-tabs ===
nnoremap <F2> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_autofind = 1
let g:nerdtree_tabs_startup_cd = 1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_synchronize_focus = 1
let g:nerdtree_tabs_synchronize_view = 1
let g:nerdtree_tabs_autoclose = 1
let g:nerdtree_tabs_meaningful_tab_names = 1
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_smart_startup_focus = 1

"=== youcompleteme ===
"指定配置文件路径
"let g:ycm_global_ycm_extra_conf = '/home/harvey/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '/home/harvey/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

"指定python的执行路径
let g:ycm_server_python_interpreter='/usr/bin/python3'

"添加预览窗口
let g:ycm_add_preview_to_completeopt = 1

"当补全完成时，是否自动关闭展示的预览窗口
let g:ycm_autoclose_preview_window_after_completion = 1

"当补全插入时，是否自动关闭展示的预览窗口
let g:ycm_autoclose_preview_window_after_insertion = 0
"显示诊断信息，但仅支持clang
let g:ycm_show_diagnostics_ui = 0

let g:ycm_server_log_level = 'info'

"输入多少个字符后，显示匹配信息
let g:ycm_min_num_of_chars_for_completion = 2

"弹出的自动补全最少候选数，默认0，表示不限制
let g:ycm_min_num_identifier_candidate_chars = 0

"从字符和注释收集信息
let g:ycm_collect_identifiers_from_comments_and_strings = 1

"在输入字符时也触发补全
let g:ycm_complete_in_strings = 1

"在输入注释时也触发补全
let g:ycm_complete_in_comments = 1

"触发提示热键
let g:ycm_key_invoke_completion = '<c-space>'

set completeopt=menu,menuone
"set completeopt=longest,menu
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"开启YCM基于标签引擎
let g:ycm_collect_identifiers_from_tags_files = 1

"禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc = 0

"语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1

"启动自动补全
let g:ycm_auto_trigger = 1

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

let g:ycm_filetype_whitelist = {
                \ "c":1,
                \ "cpp":1,
                \ "objc":1,
                \ "sh":1,
                \ "zsh":1,
                \ "zimbu":1,
                \ }

"=== syntastic ===
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"=== nerdcommenter ===
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

",ca，在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
",cc，注释当前行
",c，切换注释/非注释状态
",cs，以”性感”的方式注释
",cA，在当前行尾添加注释符，并进入Insert模式
",cu，取消注释
"Normal模式下，几乎所有命令前面都可以指定行数。  比如  输入  6,cs    的意思就是以性感方式注释光标所在行开始6行代码
"Visual模式下执行命令，会对选中的特定区块进行注释/反注释

"=== vim-indent-guides ===
let g:indent_guides_enable_on_vim_startup = 1

"=== vim-trailing-whitespace ===
nnoremap <leader><space> :FixWhitespace<cr>

"=== rainbow_parentheses ===
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"=== vim-multiple-cursors ===
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"=== echodoc.vim ===
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
highlight link EchoDocFloat Pmenu

"=== coc ===
"let g:coc_start_at_startup=0 function! CocTimerStart(timer) exec "CocStart" endfunction call timer_start(500,'CocTimerStart',{'repeat':1})

"let g:coc_global_extensions = ['coc-ccls','coc-yank','coc-tabnine','coc-snippets','coc-ultisnips','coc-neosnippet','coc-tsserver','coc-lists','coc-gitignore','coc-highlight']
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Use tab for trigger completion with characters ahead and navigate.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)

"augroup mygroup
"  autocmd!
  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

" Using CocList
" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

endfunc

call NvimBaseSetting()
call PlugSetting()

