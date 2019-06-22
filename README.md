![VIM](https://dnp4pehkvoo6n.cloudfront.net/43c5af597bd5c1a64eb1829f011c208f/as/Ultimate%20Vimrc.svg)

# The Ultimate vimrc

This is a fork of [amix's vimrc](https://github.com/amix/vimrc). It has diverged in some important ways since being forked, the most important of which is that it now uses [vim-plug](https://github.com/junegunn/vim-plug) for managing plugins instead of Pathogen. This makes plugin management easier and doesn't rely on a python script downloading zip files. It also now has a simplified vim file layout: everything is in ``vimrc.vim``. This is because I was having to use Vim on Windows, where path loading is an absolute nightmare. Lastly, I'm using different (nad fewer) plugins than the original.

This vimrc is intended to work with Vim8, using an earlier version will probably break some things.

Over the last 2 years, I have used and tweaked Vim. This configuration is the ultimate vimrc (or at least my version of it).

There is just one version:

* **The Awesome**: Includes a ton of useful plugins, color schemes, and configurations

I would, of course, recommend using the awesome version.


## How to install the Awesome version?
### Install for your own user only
The awesome version includes a lot of great plugins, configurations and color schemes that make Vim a lot better. To install it simply do following from your terminal:

	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh

You'll probably need to change the ``D:\casa\Vim\.vim_runtime`` to whatever the absolute path of .vim_runtime is for you.	

## Fonts

I recommend using [Hack](http://sourcefoundry.org/hack/) (it's an open-source and awesome font that can make your code beautiful). The Awesome vimrc is already setup to try to use it.

Some other fonts that Awesome will try to use:

* [Source Code Pro](https://adobe-fonts.github.io/source-code-pro/)
* [IBM Plex Mono font](https://github.com/IBM/plex)

Yet more fonts that are nice in general:

* [Input Mono](http://input.fontbureau.com/)


## How to install on Windows?

Use [gitforwindows](http://gitforwindows.org/) to checkout the repository and run the installation instructions above. Or use WSL, if you can. Or just use Linux&trade;.


## How to install on Linux

Just follow the directions above. And, ya know, have Vim installed.


## How to update to latest version?

Do a pull if you've not made any changes, a rebase otherwise.

    cd ~/.vim_runtime
    git pull --rebase


## Included Plugins

I recommend reading the docs of these plugins to understand them better. Each plugin provides a much better Vim experience!

* [ale](https://github.com/w0rp/ale): Syntax and lint checking for vim (async)
* [bufexplorer](https://github.com/vim-scripts/bufexplorer.zip): Quickly and easily switch between buffers. This plugin can be opened with `<leader+o>`
* [fzf.vim](https://github.com/junegunn/fzf): A command-line fuzzy finder that works with Vim.
* [goyo.vim](https://github.com/junegunn/goyo.vim) and [vim-zenroom2](https://github.com/amix/vim-zenroom2): 
* [lightline.vim](https://github.com/itchyny/lightline.vim): A light and configurable statusline/tabline for Vim
* [mru.vim](https://github.com/vim-scripts/mru.vim): Plugin to manage Most Recently Used (MRU) files. This plugin can be opened with `<leader+f>`
* [vim-commentary](https://github.com/tpope/vim-commentary): Comment stuff out.  Use `gcc` to comment out a line (takes a count), `gc` to comment out the target of a motion. `gcu` uncomments a set of adjacent commented lines.
* [vim-flake8](https://github.com/nvie/vim-flake8): Flake8 plugin for Vim
* [vim-fugitive](https://github.com/tpope/vim-fugitive): A Git wrapper so awesome, it should be illegal
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter): A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
* [vim-markdown](https://github.com/tpope/vim-markdownr): Vim Markdown runtime files
* [vim-repeat](https://github.com/tpope/vim-repeat): Enable repeating supported plugin maps with "."
* [vim-yankstack](https://github.com/maxbrunsfeld/vim-yankstack): Maintains a history of previous yanks, changes and deletes
* [vim-startify](https://github.com/mhinz/vim-startify): Fancy start screen allowing easy access to recently used files.
* [vim-easymotion](https://github.com/easymotion/vim-easymotion): Simplifies many motions by taking out the `<number>` and highlighting jump points with letters. Use with `<leader><leader><motion>`.
* [vim-vinegar](https://github.com/tpope/vim-vinegar): Combine with netrw to create a delicious salad dressing


## Included color schemes

* [gruvbox](https://github.com/morhetz/gruvbox): The default
* [palenight.vim](https://github.com/drewtempelmeyer/palenight.vim): Default for text files
* [AfterColors.vim](https://github.com/vim-scripts/AfterColors.vim): Allow for tweaking colorschemes without needing to fork them.


## How to include your own stuff?

Edit your ``.vimrc`` file after the ``runtime! vimrc.vim`` line.


## Key Mappings

The [leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader) is `<space>`, so whenever you see `<leader>` it means `<space>`.

Additional escape mappings are: `jj`, `jk`, and `hj`.

Vertical movement mappings `j`, `k`, `n`, and `N` have been combined with `zz` so that the cursor is always centered vertically on moves.


### Plugin related mappings

Open [bufexplorer](https://github.com/vim-scripts/bufexplorer.zip) to see and manage the current buffers (`<leader>o`):
    
    map <leader>o :BufExplorer<cr>

Open [MRU.vim](https://github.com/vim-scripts/mru.vim) to see the recently open files (`<leader>f`):

    map <leader>f :MRU<CR>

Open [FZF](https://github.com/junegunn/fzf.vim) plugin to quickly find a file (`<leader>j`):
    
netrw mappings:

    map <leader>nn :Explore<cr>
    map <leader>nv :Vexplore!<cr>

[goyo.vim](https://github.com/junegunn/goyo.vim) and [vim-zenroom2](https://github.com/amix/vim-zenroom2) lets you only focus on one thing at a time. It removes all the distractions and centers the content. It has a special look when editing Markdown, reStructuredText and textfiles. It only has one mapping. (`<leader>z`)

    map <leader>z :Goyo<cr>


### Normal mode mappings

Fast saving of a buffer (`<leader>w`):

	nmap <leader>w :w!<cr>
	
Fast closing of a buffer (`<leader>q`):

	nmap <leader>q :q<cr>
	
Fast writing and closing of a buffer (`<leader>x`):

	nmap <leader>x :x<cr>
	
Map `\` to `/\v` (magic search)
	
	map \ /\v

Disable highlights when you press `<leader><cr>`:
	
	map <silent> <leader><cr> :noh<cr>

Smart way to move between windows (`<ctrl>j` etc.):
	
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

Closing of the current buffer(s) (`<leader>bd` and (`<leader>ba`)):
	
	" Close current buffer
	map <leader>bd :Bclose<cr>
	
	" Close all buffers
	map <leader>ba :1,1000 bd!<cr>
	
Useful mappings for managing tabs:
	
	map <leader>tn :tabnew<cr>
	map <leader>to :tabonly<cr>
	map <leader>tc :tabclose<cr>
	map <leader>tm :tabmove 
	
	" Opens a new tab with the current buffer's path
	" Super useful when editing files in the same directory
	map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/


### Visual mode mappings

Visual mode pressing `*` or `#` searches for the current selection:

	vnoremap <silent> * :call VisualSelection('f')<CR>
	vnoremap <silent> # :call VisualSelection('b')<CR>


### Command line mappings

Write the file as sudo (works only on Unix). Super useful when you open a file and you don't have permissions to save your changes. [Vim tip](http://vim.wikia.com/wiki/Su-write):

    :W 


### Spell checking
Pressing `<leader>ss` will toggle spell checking:

    map <leader>ss :setlocal spell!<cr>

## How to uninstall
Just do following:
* Remove `~/.vim_runtime`
* Remove any lines that reference `.vim_runtime` in your `~/.vimrc`
