HOME=/home/albert
PWD=$$(pwd)

.PHONY: vim bash git xmonad

all:
	make bash
	make vim
	make git
	make xmonad
	cat programs

vim:
	ln -s $(PWD)/vimrc $(HOME)/.vimrc
	ln -s $(PWD)/vim $(HOME)/.vim
	if [ ! -d vim/bundle ] ; then mkdir vim/bundle ; fi
	cd vim/bundle ; \
	for plugin in $$(cat ../plugins); do \
		git clone $$plugin ; \
	done; \
	cd vimproc.vim; make


bash:
	ln -s $(PWD)/bashrc $(HOME)/.bashrc
	ln -s $(PWD)/dircolors $(HOME)/.dircolors

git:
	ln -s $(PWD)/gitconfig $(HOME)/.gitconfig

xmonad:
	if [ ! -d $(HOME)/.xmonad ] ; then mkdir $(HOME)/.xmonad ; fi
	ln -s $(PWD)/xmonad/xmonad.hs $(HOME)/.xmonad/xmonad.hs
	sudo ln -s $(PWD)/xmonad/xmonad.session /usr/share/gnome-session/sessions/
	sudo ln -s $(PWD)/xmonad/xmonad-unity-session.desktop /usr/share/xsessions/
