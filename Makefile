.PHONY: dotfiles dotfiles-git dotfiles-tmux dotfiles-vim dotfiles-alacritty dotfiles-zsh

dotfiles: dotfiles-git dotfiles-tmux dotfiles-vim dotfiles-alacritty dotfiles-zsh
	@echo "部署 Dotfiles 環境..."

dotfiles-git:
	@echo "部署 Git Dotfiles..."
	stow -v -t $$HOME --dotfiles git

dotfiles-tmux:
	@echo "部署 Tmux Dotfiles..."
	stow -v -t $$HOME --dotfiles tmux

dotfiles-vim:
	@echo "部署 Vim Dotfiles..."
	stow -v -t $$HOME --dotfiles vim

dotfiles-zsh:
	@echo "部署 Zsh Dotfiles..."
	stow -v -t $$HOME --dotfiles zshrc

dotfiles-alacritty:
	@echo "部署 Alacritty Dotfiles..."
	@if [ "$$(uname -s)" = "Darwin" ]; then \
		echo "檢測到 macOS，部署 alacritty-mac config"; \
		stow -v -t $$HOME alacritty-mac; \
	elif [ "$$(uname -s)" = "Linux" ]; then \
		echo "檢測到 Linux，部署 alacritty-debian config"; \
		stow -v -t $$HOME alacritty-debian; \
	else \
		echo "不支援的作業系統: $$(uname -s)"; \
		exit 1; \
	fi
