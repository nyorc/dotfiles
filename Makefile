# 這裡放 stow 的組合指令
# - 要刪除的話，請手動加上 -D 參數
.PHONY: dotfiles dotfiles-git dotfiles-tmux dotfiles-vim dotfiles-alacritty dotfiles-zsh dotfiles-rime

dotfiles: dotfiles-git dotfiles-tmux dotfiles-vim dotfiles-alacritty dotfiles-zsh dotfiles-rime
	@echo "部署全部 Dotfiles"

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

dotfiles-rime:
	@echo "部署 Rime Dotfiles..."
	stow -vv -t $$HOME/.config/ibus/rime rime
