VIMBKP=~/.vimbkp-$(shell date +"%Y-%m-%d")

clean:
	$(info Cleaning...)
	echo "Cleaning"
	rm -rf bundle/*

backup:
	$(info Making backup at $(VIMBKP))
	mkdir $(VIMBKP)
	mv ~/.vim $(VIMBKP)/
	mv ~/.vimrc $(VIMBKP)/
	-mv ~/.viminfo $(VIMBKP)/
	-mv ~/.vimtags $(VIMBKP)/

deploy: link install-vundle install-bundles build-deps fonts

link:
	cd ~/ && ln -s ~/.vim/.vimrc .vimrc

install-vundle:
	$(info Installing Vundle...)
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

install-python-mode:
	$(info Installing Python-Mode...)
	cd ~/.vim/bundle
	git clone https://github.com/klen/python-mode.git

install-bundles:
	$(info Installing bundles...)
	vim +PluginInstall +qall

build-deps:
	$(info Building dependencies...)
	sudo dnf install cmake clang clang-devel wmctrl automake gcc gcc-c++ kernel-devel python-devel python3-devel -y
	cd ~/.vim/plugged/YouCompleteMe && ./install.py --clang-completer

fonts:
	$(info Copying fonts...)
	cp -rp fonts/ ~/.local/share/fonts
	fc-cache -f ~/.local/share/fonts

PHONY: clean deploy link install-vundle install-bundles install-python-mode build-deps fonts
