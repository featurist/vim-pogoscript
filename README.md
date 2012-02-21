# Installation

## Install Pathogen

It's best (although not required) to install [pathogen](http://www.vim.org/scripts/script.php?script_id=2332), which allows vim scripts to be bundled and installed separately:

    mkdir -p ~/.vim/autoload ~/.vim/bundle 
    curl 'www.vim.org/scripts/download_script.php?src_id=16224' > ~/.vim/autoload/pathogen.vim

And initialise it in your `.vimrc`:

    echo 'call pathogen#infect()' >> ~/.vimrc

## Install Vim PogoScript

    cd ~/.vim/bundle
    git clone https://github.com/featurist/vim-pogoscript.git pogosript

To update:

    cd ~/.vim/bundle/pogoscript
    git pull
