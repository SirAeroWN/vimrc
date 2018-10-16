import zipfile
import shutil
import tempfile
import requests

from os import path
from collections import namedtuple


# --- Globals ----------------------------------------------
Repo = namedtuple('Repo', ['path', 'name'])

PLUGINS="""
w0rp/ale
maxbrunsfeld/vim-yankstack
mileszs/ack.vim
corntrace/bufexplorer
ctrlpvim/ctrlp.vim
scrooloose/nerdtree
amix/open_file_under_cursor.vim
vim-scripts/tlib
MarcWeber/vim-addon-mw-utils
michaeljsmith/vim-indent-object
tpope/vim-fugitive
junegunn/goyo.vim
amix/vim-zenroom2
tpope/vim-repeat
tpope/vim-commentary
airblade/vim-gitgutter
digitaltoad/vim-pug
itchyny/lightline.vim
maximbaz/lightline-ale
tpope/vim-abolish
vim-scripts/mru.vim
mhinz/vim-startify
vim-scripts/AfterColors.vim

" autocomplete

" motions
easymotion/vim-easymotion
yuttie/comfortable-motion.vim

" repl
jalvesaq/vimcmdline

" language specific
fatih/vim-go
nvie/vim-flake8
tpope/vim-markdown

" colorschemes
nightsense/carbonized
ErichDonGubler/vim-sublime-monokai
dracula/dracula-theme
drewtempelmeyer/palenight.vim
joshdick/onedark.vim
arcticicestudio/nord-vim
ayu-theme/ayu-vim
morhetz/gruvbox
altercation/vim-colors-solarized
vim-scripts/peaksea
twerth/ir_black
""".strip()

GITHUB_ZIP = 'https://github.com/%s/archive/master.zip'

SOURCE_DIR = path.join(path.dirname(__file__), 'sources_non_forked')


def download_extract_replace(plugin_name, zip_path, temp_dir, source_dir):
    temp_zip_path = path.join(temp_dir, plugin_name)

    # Download and extract file in temp dir
    req = requests.get(zip_path)
    open(temp_zip_path, 'wb').write(req.content)

    zip_f = zipfile.ZipFile(temp_zip_path)
    zip_f.extractall(temp_dir)

    plugin_temp_path = path.join(temp_dir, path.join(temp_dir, '%s-master' % plugin_name))

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)
    print('Updated {0}'.format(plugin_name))


def update(plugin):
    zip_path = GITHUB_ZIP % plugin.path
    download_extract_replace(plugin.name, zip_path, temp_directory, SOURCE_DIR)


def parse_plugins(full_str):
    qualified_names = list(filter(lambda s: s != '' and not s.startswith('"'), [s.strip() for s in full_str.splitlines()]))
    global Repo
    return [Repo(path=s, name=s.split('/')[-1]) for s in qualified_names]


if __name__ == '__main__':
    temp_directory = tempfile.mkdtemp()
    print(temp_directory)

    try:
        plugins = parse_plugins(PLUGINS)
        [update(x) for x in plugins]
    finally:
        shutil.rmtree(temp_directory)

    quit()
    try:
        plugins = PLUGINS.splitlines()
        plugins.sort()
        [update(x) for x in plugins]
    finally:
        shutil.rmtree(temp_directory)
