#  	 __  __       _         __ _ _
#	|  \/  | __ _| | _____ / _(_) | ___
#	| |\/| |/ _` | |/ / _ \ |_| | |/ _ \
#	| |  | | (_| |   <  __/  _| | |  __/
#	|_|  |_|\__,_|_|\_\___|_| |_|_|\___|
#
# source - https://github.com/sdatth/dotfiles
# makefile to copy conf projects from dotfiles repo

all:
	cp $(HOME)/dotfiles/Makefile $(HOME)/Stuff/projects/configs/shell-scripts/Makefile 
	cp $(HOME)/dotfiles/configurations/.Xresources $(HOME)/Stuff/projects/configs/Xresources/Xresources
	cp $(HOME)/dotfiles/configurations/.zshrc $(HOME)/Stuff/projects/configs/zshrc/zshrc
	cp $(HOME)/dotfiles/configurations/.vimrc $(HOME)/Stuff/projects/configs/vimrc/vimrc
	cp $(HOME)/dotfiles/configurations/.config/starship.toml $(HOME)/Stuff/projects/configs/starship/starship.toml
	cp $(HOME)/dotfiles/configurations/.config/ranger/scope.sh $(HOME)/Stuff/projects/configs/ranger/scope.sh
	cp $(HOME)/dotfiles/configurations/.config/ranger/rc.conf $(HOME)/Stuff/projects/configs/ranger/rc.conf
	cp $(HOME)/dotfiles/configurations/.config/nvim/init.vim $(HOME)/Stuff/projects/configs/nvimrc/nvimrc
	cp $(HOME)/dotfiles/configurations/.bashrc $(HOME)/Stuff/projects/configs/bashrc/bashrc
	cp $(HOME)/dotfiles/configurations/.config/alacritty/alacritty.yml $(HOME)/Stuff/projects/configs/alacritty/alacritty.yml
	cp $(HOME)/.config/Code/User/settings.json $(HOME)/Stuff/projects/configs/vscode/settings.json
	cp $(HOME)/dotfiles/configurations/.config/fish/config.fish $(HOME)/Stuff/projects/configs/fish/config.fish

delete:
	rm $(HOME)/Stuff/projects/configs/shell-scripts/Makefile
	rm $(HOME)/Stuff/projects/configs/Xresources/Xresources
	rm $(HOME)/Stuff/projects/configs/zshrc/zshrc
	rm $(HOME)/Stuff/projects/configs/vimrc/vimrc
	rm $(HOME)/Stuff/projects/configs/starship/starship.toml
	rm $(HOME)/Stuff/projects/configs/ranger/scope.sh
	rm $(HOME)/Stuff/projects/configs/ranger/rc.conf
	rm $(HOME)/Stuff/projects/configs/nvimrc/nvimrc
	rm $(HOME)/Stuff/projects/configs/bashrc/bashrc
	rm $(HOME)/Stuff/projects/configs/alacritty/alacritty.yml
	rm $(HOME)/Stuff/projects/configs/fish/config.fish
