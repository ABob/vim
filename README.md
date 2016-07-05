# vim

My personal vim configuration: vimrc settings and plugins.

This repository was created to make my vim configuration movable to my different platforms. Instructions were taken from 
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

Plugins were installed over pathogen. New plugins should be added as submodules, if they are cloned from their git repositories. 

-To install this configuration on another machine, run:
```
cd ~
git clone https://github.com/ABob/vim.git   ### or git clone git@github.com:ABob/vim.git
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule update --init
```

-To upggrade a plugin, run:
```
cd ~/.vim/bundle/<plugin>
git pull origin master
```

-To upgrade all bundles, run:
```
git submodule foreach git pull origin master
```
