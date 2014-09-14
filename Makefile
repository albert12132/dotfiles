PWD=$$(pwd)

.PHONY: vim vimrc bash git xmonad

#################
# PHONY TARGETS #
#################

all: bash vim git xmonad
	@echo Programs to install:
	@cat programs

vim: $$HOME/.vimrc $$HOMe/.vim

vimrc: $$HOME/.vimrc

bash: $$HOME/.bashrc $$HOME/.dircolors

git: $$HOME/.gitconfig

xmonad: $$HOME/.xmonad/xmonad.hs
	# TODO: resolve the following for Ubuntu 14.04 (I don't think unity integration works)
	# sudo ln -s $(PWD)/xmonad/xmonad.session /usr/share/gnome-session/sessions/
	# sudo ln -s $(PWD)/xmonad/xmonad-unity-session.desktop /usr/share/xsessions/
	
###########
# Targets #
###########

$$HOME/.vimrc: vimrc
	ln -s $< $@
	
$$HOME/.vim: vim
	# TODO: Clone vundle
	ln -s $< $@
	# TODO: make vimproc

$$HOME/.bashrc: bashrc
	ln -s $< $@
	
$$HOME/.dircolors: dircolors
	ln -s $< $@
	
$$HOME/.gitconfig: gitconfig
	ln -s $< $@
	
$$HOME/.xmonad:
	mkdir $@

$$HOME/.xmonad/xmonad.hs: xmonad/xmonad.hs $$HOME/.xmonad
	ln -s $< $@
