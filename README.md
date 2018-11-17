![VIM](https://dnp4pehkvoo6n.cloudfront.net/43c5af597bd5c1a64eb1829f011c208f/as/Ultimate%20Vimrc.svg)

# The Ultimate vimrc

This is a fork of [amix's vimrc](https://github.com/amix/vimrc). It has diverged in some important ways since being forked, the most important of which is that it now uses [vim-plug](https://github.com/junegunn/vim-plug) for managing plugins instead of Pathogen. This makes plugin management easier and doesn't rely on a python script downloading zip files.

Over the last 2 years, I have used and tweaked Vim. This configuration is the ultimate vimrc (or at least my version of it).

There is just one version:

* **The Awesome**: Includes a ton of useful plugins, color schemes, and configurations

I would, of course, recommend using the awesome version.


## How to install the Awesome version?
### Install for your own user only
The awesome version includes a lot of great plugins, configurations and color schemes that make Vim a lot better. To install it simply do following from your terminal:

	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh
	

## Fonts

I recommend using [Hack](http://sourcefoundry.org/hack/) (it's an open-source and awesome font that can make your code beautiful). The Awesome vimrc is already setup to try to use it.

Some other fonts that Awesome will try to use:

* [Source Code Pro](https://adobe-fonts.github.io/source-code-pro/)
* [IBM Plex Mono font](https://github.com/IBM/plex)

Yet more fonts that are nice in general:

* [Input Mono](http://input.fontbureau.com/)


## How to install on Windows?

Use [gitforwindows](http://gitforwindows.org/) to checkout the repository and run the installation instructions above. No special instructions needed ;-)


## How to install on Linux

If you have vim aliased as `vi` instead of `vim`, make sure to either alias it: `alias vi=vim`. Otherwise, `apt-get install vim`


## How to update to latest version?

Just do a git rebase!

    cd ~/.vim_runtime
    git pull --rebase


## Some screenshots (**WARNING**: These are outdated)

Colors when editing a Python file:

![Screenshot 1](https://dnp4pehkvoo6n.cloudfront.net/07583008e4da885801657e8781777844/as/Python%20editing.png)

Opening recently opened files with the [mru.vim](https://github.com/vim-scripts/mru.vim) plugin:

![Screenshot 2](https://dnp4pehkvoo6n.cloudfront.net/1d49a88f9bd5d013c025bb1e1272a7d8/as/MRU%20plugin.png)

[NERD Tree](https://github.com/scrooloose/nerdtree) plugin in a terminal window:
![Screenshot 3](https://dnp4pehkvoo6n.cloudfront.net/ae719203166585d64728f28398f4b1b7/as/Terminal%20usage.png)

Distraction free mode using [goyo.vim](https://github.com/junegunn/goyo.vim) and [vim-zenroom2](https://github.com/amix/vim-zenroom2):
![Screenshot 4](https://dnp4pehkvoo6n.cloudfront.net/f0dcc4c9739148c56cbf8285a910ac41/as/Zen%20mode.png)


## Included Plugins

I recommend reading the docs of these plugins to understand them better. Each plugin provides a much better Vim experience!

* [ack.vim](https://github.com/mileszs/ack.vim): Vim plugin for `the_silver_searcher` (ag) or ack -- a wicked fast grep
* [bufexplorer](https://github.com/vim-scripts/bufexplorer.zip): Quickly and easily switch between buffers. This plugin can be opened with `<leader+o>`
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Fuzzy file, buffer, mru and tag finder. It's mapped to `<Ctrl+F>`
* [goyo.vim](https://github.com/junegunn/goyo.vim) and [vim-zenroom2](https://github.com/amix/vim-zenroom2): 
* [lightline.vim](https://github.com/itchyny/lightline.vim): A light and configurable statusline/tabline for Vim
* [NERD Tree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim
* [mru.vim](https://github.com/vim-scripts/mru.vim): Plugin to manage Most Recently Used (MRU) files. This plugin can be opened with `<leader+f>`
* [open_file_under_cursor.vim](https://github.com/amix/open_file_under_cursor.vim): Open file under cursor when pressing `gf`
* [ale](https://github.com/w0rp/ale): Syntax and lint checking for vim (async)
* [vim-commentary](https://github.com/tpope/vim-commentary): Comment stuff out.  Use `gcc` to comment out a line (takes a count), `gc` to comment out the target of a motion. `gcu` uncomments a set of adjacent commented lines.
* [vim-fugitive](https://github.com/tpope/vim-fugitive): A Git wrapper so awesome, it should be illegal
* [vim-indent-object](https://github.com/michaeljsmith/vim-indent-object): Defines a new text object representing lines of code at the same indent level. Useful for python/vim scripts
* [vim-yankstack](https://github.com/maxbrunsfeld/vim-yankstack): Maintains a history of previous yanks, changes and deletes
* [vim-startify](https://github.com/mhinz/vim-startify): Fancy start screen allowing easy access to recently used files.
* [vim-easymotion](https://github.com/easymotion/vim-easymotion): Simplifies many motions by taking out the `<number>` and highlighting jump points with letters. Use with `<leader><leader><motion>`.
* [comfortable-motion.vim](https://github.com/yuttie/comfortable-motion.vim): Smoother page scrolling.
* [vimcmdline](https://github.com/jalvesaq/vimcmdline): Send code to an interpreter, if running in regular vim, make sure you do so in a tmux session.


## Included color schemes

* [gruvbox](https://github.com/morhetz/gruvbox): The default
* [carbonized](https://github.com/nightsense/carbonized)
* [vim-sublime-monokai](https://github.com/ErichDonGubler/vim-sublime-monokai)
* [dracula-theme](https://github.com/dracula/dracula-theme)
* [palenight.vim](https://github.com/drewtempelmeyer/palenight.vim): Default for text files
* [onedark.vim](https://github.com/joshdick/onedark.vim)
* [nord-vim](https://github.com/arcticicestudio/nord-vim)
* [ayu-vim](https://github.com/ayu-theme/ayu-vim)
* [peaksea](https://github.com/vim-scripts/peaksea)
* [vim-irblack](https://github.com/wgibbs/vim-irblack)
* [vim-two-firewatch](https://github.com/rakr/vim-two-firewatch)
* [AfterColors.vim](https://github.com/vim-scripts/AfterColors.vim): Allow for tweaking colorschemes without needing to fork them.


## How to include your own stuff?

After you have installed the setup, you can edit ``~/.vim_runtime/my_configs.vim`` to fill in any configurations that are important for you.

You can also install your plugins, read the docs for [vim-plug](https://github.com/junegunn/vim-plug) for more information.


## Key Mappings

The [leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader) is `<space>`, so whenever you see `<leader>` it means `<space>`.

Additional escape mappings are: `jj`, `jk`, and `hj`.

Vertical movement mappings `j`, `k`, `n`, and `N` have been combined with `zz` so that the cursor is always centered vertically on moves.


### Plugin related mappings

Open [bufexplorer](https://github.com/vim-scripts/bufexplorer.zip) to see and manage the current buffers (`<leader>o`):
    
    map <leader>o :BufExplorer<cr>

Open [MRU.vim](https://github.com/vim-scripts/mru.vim) to see the recently open files (`<leader>f`):

    map <leader>f :MRU<CR>

Open [ctrlp.vim](https://github.com/kien/ctrlp.vim) plugin to quickly find a file (`<leader>j`):
    
[NERD Tree](https://github.com/scrooloose/nerdtree) mappings:

    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nb :NERDTreeFromBookmark 
    map <leader>nf :NERDTreeFind<cr>

[goyo.vim](https://github.com/junegunn/goyo.vim) and [vim-zenroom2](https://github.com/amix/vim-zenroom2) lets you only focus on one thing at a time. It removes all the distractions and centers the content. It has a special look when editing Markdown, reStructuredText and textfiles. It only has one mapping. (`<leader>z`)

    map <leader>z :Goyo<cr>

[vimcmdline](https://github.com/jalvesaq/vimcmdline) makes running a whole file or a snippet easy. Start the interpreter with `<F4>`, stop it with `<F7>`. Send a snippet with `<F6>` and the whole file with `<F5>`.

    cmdline_map_start      = '<F4>'
    cmdline_map_send       = '<F6>'
    cmdline_map_source_fun = '<F5>'
    cmdline_map_quit       = '<F7>'


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
	
Switch [CWD](http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file) to the directory of the open buffer:
	
	map <leader>cd :cd %:p:h<cr>:pwd<cr>
	
Open `ack.vim` for fast search:
	
	map <leader>g :Ack 

Toggle paste mode on and off:
	
	map <leader>pp :setlocal paste!<cr>


### Visual mode mappings

Visual mode pressing `*` or `#` searches for the current selection:

	vnoremap <silent> * :call VisualSelection('f')<CR>
	vnoremap <silent> # :call VisualSelection('b')<CR>

When you press gv you `Ack.vim` after the selected text:

	vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

When you press `<leader>r` you can search and replace the selected text:

	vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>


### Insert mode mappings

Insert the current date and time (useful for timestamps):

    iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


### Command line mappings

$q is super useful when browsing on the command line. It deletes everything until the last slash:

    cno $q <C-\>eDeleteTillSlash()<cr>

Bash like keys for the command line:

    cnoremap <C-A>		<Home>
    cnoremap <C-E>		<End>
    cnoremap <C-K>		<C-U>

    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>

Write the file as sudo (works only on Unix). Super useful when you open a file and you don't have permissions to save your changes. [Vim tip](http://vim.wikia.com/wiki/Su-write):

    :W 


### Spell checking
Pressing `<leader>ss` will toggle spell checking:

    map <leader>ss :setlocal spell!<cr>


### Cope
Query `:help cope` if you are unsure what cope is. It's super useful!

When you search with `Ack.vim`, display your results in cope by doing:
`<leader>cc`

To go to the next search result do:
`<leader>n`

To go to the previous search results do:
`<leader>p`

Cope mappings:

    map <leader>cc :botright cope<cr>
    map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>


## How to uninstall
Just do following:
* Remove `~/.vim_runtime`
* Remove any lines that reference `.vim_runtime` in your `~/.vimrc`
