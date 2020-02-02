all: build

sync:
	mkdir ~/.config
	mkdir ~/.config/nvim
	mkdir ~/.config/alacritty
	mkdir ~/.config/fish
	mkdir ~/.config/fish/functions
	mkdir ~/.nvm

	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/vimrc ~/.config/nvim/init.vim
	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmuxconf ~/.tmux.conf
	[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.agignore ] || ln -s $(PWD)/agignore ~/.agignore
	[ -f ~/.config/fish/functions/fish_prompt.fish ] || ln -s $(PWD)/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
	[ -f ~/.config/fish/functions/fish_right_prompt.fish ] || ln -s $(PWD)/fish_right_prompt.fish ~/.config/fish/functions/fish_right_prompt.fish
	[ -f ~/.config/fish/aliases.fish ] || ln -s $(PWD)/aliases.fish ~/.config/fish/aliases.fish
	[ -f ~/.config/fish/fish_variables ] || ln -s $(PWD)/fish_variables ~/.config/fish/fish_variables
	[ -f ~/.config/fish/config.fish ] || ln -s $(PWD)/config.fish ~/.config/fish/config.fish
	[ -f ~/.config/fish/.iterm2_shell_integration.fish ] || ln -s $(PWD)/.iterm2_shell_integration.fish ~/.config/fish/.iterm2_shell_integration.fish

	# don't show last login message
	touch ~/.hushlogin

	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

clean:
	rm -f ~/.vimrc 
	rm -rf ~/.config
	rm -f ~/.bashrc
	rm -f ~/.tmux.conf
	rm -f ~/.tigrc
	rm -f ~/.gitconfig
	rm -f ~/.agignore
	rm -f ~/.ssh/config

.PHONY: all clean sync build run kill
