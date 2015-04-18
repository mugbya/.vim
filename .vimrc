
"======================================================================
"
"			mugbya的vim配置文件
"
"======================================================================

set autoread        " 设置当文件被改动时自动载入
set nocompatible    " 关闭兼容模式
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示 
set go=             " GUI时，不要菜单工具条
set fileencodings=utf8,cp936,gb18030,big5
filetype off 

"======================================================================
"  设置 Vundle 插件， 用于管理其他插件
"  set the runtime path to include Vundle and initialize
"======================================================================
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Plugin 'Powerline' 不好用啊

" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" Plugin 'SirVer/ultisnips'
" Plugin 'othree/xml.vim'      		" format html
" Plugin 'jistr/vim-nerdtree-tabs' 
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/csapprox'    		" 支持vim主题在终端透明
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline' 		" 状态行插件
Plugin 'ryanoasis/vim-webdevicons'	" 图标插件
Plugin 'plasticboy/vim-markdown'
Plugin 'maksimr/vim-jsbeautify'         " js代码格式

call vundle#end()            " required
filetype plugin indent on    " required
" -----------------------------------------------------

"======================================================================
"			   vim系统配置 
"======================================================================

syntax enable                    " 启用语法高亮度


set hlsearch			 " 高亮显示所有的匹配短语
set incsearch			 " 查找短语时显示部分匹配
set number                       " 显示行号
set tabstop=8                    " 让一个tab等于8个空格,即默认
set sts=4
set sw=4
set wrap                         " 自动换行(编辑时)
set linebreak                    " 英文单词在换行时不被截断


" set list                     " 显示Tab符，
" set listchars=tab:\|\ ,      " 使用一高亮竖线代替 把符号显示为 |


" set formatoptions+=mM

"set cul	

set t_Co=256
" set term=xterm
" set background=dark

" colorscheme wildChild
colorscheme mymolokai   " 模拟sublime text 的主题
" colorscheme monokai
" colorscheme lilypink

set showcmd         " 输入的命令显示出来，看的清楚些 
set novisualbell    " 不要闪烁(不明白)  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  
 

" set autoindent      " vim使用自动对齐，也就是把当前行的对齐格式应用到下一行(自动缩进）

" set cindent         "（cindent是特别针对C语言语法自动缩进）

" set smartindent     " 依据上面的对齐格式，智能的选择对齐方式，对于类似C语言编写上有用 


let g:NERDTreeHighlightCursorline=0
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', 'blue', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')




" set hlsearch       " 高亮显示结果

set incsearch      " 在输入要搜索的文字时，vim会实时匹配

set backspace=indent,eol,start whichwrap+=<,>,[,] "允许退格键的使用

" inoremap <silent> <Esc> <C-O>:stopinsert<CR>
" inoremap <silent> <Esc> <C-O>:stopinsert<CR>        

"字体的设置  ---占时为空


"======= 树插件设置=================================
"
nnoremap <F2> :exe 'NERDTreeToggle'<CR>        " 树的快捷键
" autocmd vimenter * NERDTree                  " 自动打开树
" 打开vim时，自动打开树当只剩NERDTree时，则自动关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 
"
"====================================================

" 折叠
 set foldenable
" set foldmethod=indent
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>


set pastetoggle=<F5>        " 粘贴的快捷键



"=======================================================
"	     vim-webdevicons 配置
"=======================================================
let g:webdevicons_enable = 1 
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'x'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = { 'js': 'mycoolJSfontglyph' }
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = { 'MyReallyCoolFile.okay': 'myreallycoolglyph' }
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['myext'] = 'mysymbol'


"=======================================================
"            vim-markdown 的配置
"=======================================================
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1



"=======================================================
"            neocomplcache.vim 的配置
"=======================================================
 let g:neocomplcache_enable_at_startup = 1 
 

"=======================================================
"            vim-jsbeautify的配置
"=======================================================
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

