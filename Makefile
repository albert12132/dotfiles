HOME=/home/albert
PWD=$$(pwd)

.PHONY: vim bash git xmonad

vim:
	ln -s $(PWD)/vimrc $(HOME)/.vimrc
	ln -s $(PWD)/vim $(HOME)/.vim
	if [ ! -d vim/bundle ] ; then mkdir vim/bundle ; fi
	cd vim/bundle ; \
	for plugin in $$(cat ../plugins); do \
		git clone $$plugin ; \
	done \

bash:
	ln -s $(PWD)/bashrc $(HOME)/.bashrc
	ln -s $(PWD)/dircolors $(HOME)/.dircolors

git:
	ln -s $(PWD)/gitconfig $(HOME)/.gitconfig

xmonad:
	if [ ! -d $(HOME)/.xmonad ] ; then mkdir $(HOME)/.xmonad ; fi
	ln -s $(PWD)/xmonad.hs $(HOME)/.xmonad/xmonad.hs
