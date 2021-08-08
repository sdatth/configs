# makefile to hardlink conf files

all: delete
	ln $(HOME)/dotfiles/Makefile $(HOME)/Stuff/files/configs/shell-scripts/Makefile 
	ln $(HOME)/dotfiles/configurations/.Xresources $(HOME)/Stuff/files/configs/Xresources/Xresources
	ln $(HOME)/dotfiles/configurations/.zshrc $(HOME)/Stuff/files/configs/zshrc/zshrc
	ln $(HOME)/dotfiles/configurations/.vimrc $(HOME)/Stuff/files/configs/vimrc/vimrc
	ln $(HOME)/dotfiles/configurations/.config/starship.toml $(HOME)/Stuff/files/configs/starship/starship.toml
	ln $(HOME)/dotfiles/configurations/.config/ranger/scope.sh $(HOME)/Stuff/files/configs/ranger/scope.sh
	ln $(HOME)/dotfiles/configurations/.config/ranger/rc.conf $(HOME)/Stuff/files/configs/ranger/rc.conf
	ln $(HOME)/dotfiles/configurations/.config/nvim/init.vim $(HOME)/Stuff/files/configs/nvimrc/nvimrc
	ln $(HOME)/dotfiles/configurations/.bashrc $(HOME)/Stuff/files/configs/bashrc/bashrc
	ln $(HOME)/dotfiles/configurations/.config/alacritty/alacritty.yml $(HOME)/Stuff/files/configs/alacritty/alacritty.yml

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
