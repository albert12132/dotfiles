PWD=$$(pwd)

.PHONY: vim vimrc bash git xmonad

#################
# PHONY TARGETS #
#################

all: bash vim git xmonad
	@echo Programs to install:
	@cat programs

vim: $(HOME)/.vimrc $(HOME)/.vim

vimrc: $(HOME)/.vimrc

bash: $(HOME)/.bashrc $(HOME)/.dircolors $(HOME)/.bash_prompt

git: $(HOME)/.gitconfig

xmonad: $(HOME)/.xmonad/xmonad.hs
	# TODO: resolve the following for Ubuntu 14.04 (I don't think unity integration works)
	# sudo ln -s $(PWD)/xmonad/xmonad.session /usr/share/gnome-session/sessions/
	# sudo ln -s $(PWD)/xmonad/xmonad-unity-session.desktop /usr/share/xsessions/
	
###########
# Targets #
###########

$(HOME)/.vimrc: vim-files/vimrc
	ln -s $(abspath $<) $@
	
$(HOME)/.vim: vim-files/vim
	ln -s $(abspath $<) $@
	git clone https://github.com/gmarik/Vundle.vim.git $@/bundle/Vundle.vim
	vim +PluginInstall +qall
	cd $@/bundle/vimproc.vim; make

$(HOME)/.bashrc: bash-files/bashrc
	ln -s $(abspath $<) $@
	
$(HOME)/.dircolors: bash-files/dircolors
	ln -s $(abspath $<) $@
	
$(HOME)/.bash_prompt: bash-files/bash_prompt
	ln -s $(abspath $<) $@
	
$(HOME)/.gitconfig: gitconfig
	ln -s $(abspath $<) $@
	
$(HOME)/.xmonad:
	mkdir $@

$(HOME)/.xmonad/xmonad.hs: xmonad/xmonad.hs $(HOME)/.xmonad
	ln -s $< $@
