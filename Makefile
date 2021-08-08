# makefile to hardlink conf files

all:
	cp $(HOME)/dotfiles/Makefile $(HOME)/Stuff/files/configs/shell-scripts/Makefile 
	cp $(HOME)/dotfiles/configurations/.Xresources $(HOME)/Stuff/files/configs/Xresources/Xresources
	cp $(HOME)/dotfiles/configurations/.zshrc $(HOME)/Stuff/files/configs/zshrc/zshrc
	cp $(HOME)/dotfiles/configurations/.vimrc $(HOME)/Stuff/files/configs/vimrc/vimrc
	cp $(HOME)/dotfiles/configurations/.config/starship.toml $(HOME)/Stuff/files/configs/starship/starship.toml
	cp $(HOME)/dotfiles/configurations/.config/ranger/scope.sh $(HOME)/Stuff/files/configs/ranger/scope.sh
	cp $(HOME)/dotfiles/configurations/.config/ranger/rc.conf $(HOME)/Stuff/files/configs/ranger/rc.conf
	cp $(HOME)/dotfiles/configurations/.config/nvim/init.vim $(HOME)/Stuff/files/configs/nvimrc/nvimrc
	cp $(HOME)/dotfiles/configurations/.bashrc $(HOME)/Stuff/files/configs/bashrc/bashrc
	cp $(HOME)/dotfiles/configurations/.config/alacritty/alacritty.yml $(HOME)/Stuff/files/configs/alacritty/alacritty.yml

delete:
	rm $(HOME)/Stuff/files/configs/shell-scripts/Makefile
	rm $(HOME)/Stuff/files/configs/Xresources/Xresources
	rm $(HOME)/Stuff/files/configs/zshrc/zshrc
	rm $(HOME)/Stuff/files/configs/vimrc/vimrc
	rm $(HOME)/Stuff/files/configs/starship/starship.toml
	rm $(HOME)/Stuff/files/configs/ranger/scope.sh
	rm $(HOME)/Stuff/files/configs/ranger/rc.conf
	rm $(HOME)/Stuff/files/configs/nvimrc/nvimrc
	rm $(HOME)/Stuff/files/configs/bashrc/bashrc
	rm $(HOME)/Stuff/files/configs/alacritty/alacritty.yml
