# 這裡放 stow 的組合指令
# - 要刪除時，請手動加上 -D 參數
# - 要測試時，請手動加上 -n 參數

UNAME_S := $(shell uname -s)
$(if $(UNAME_S),,$(error "未知的作業系統"))

.PHONY: help
help: ## Show this help message
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: \n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  %-20s %s\n", $$1, $$2 } /^##@/ { printf "%s\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: dotfiles
dotfiles: dotfiles-git dotfiles-tmux dotfiles-vim dotfiles-alacritty dotfiles-zsh dotfiles-rime ## Deploy all dotfiles
	@echo "Deploy all dotfiles"

.PHONY: dotfiles-git
dotfiles-git: ## Deploy git dotfiles
	@echo "Deploy git dotfiles"
	stow -v -t $$HOME --dotfiles git

.PHONY: dotfiles-tmux
dotfiles-tmux: ## Deploy tmux dotfiles
	@echo "Deploy tmux dotfiles"
	stow -v -t $$HOME --dotfiles tmux

.PHONY: dotfiles-vim
dotfiles-vim: ## Deploy vim dotfiles
	@echo "Deploy vim dotfiles"
	stow -v -t $$HOME --dotfiles vim

.PHONY: dotfiles-zsh
dotfiles-zsh: ## Deploy zsh dotfiles
	@echo "Deploy zsh dotfiles"
	stow -v -t $$HOME --dotfiles zshrc

ALACRITTY_DOTFILE_DIR_Darwin := alacritty-mac
ALACRITTY_DOTFILE_DIR_Linux  := alacritty-debian
ALACRITTY_DOTFILE_DIR      := $(ALACRITTY_DOTFILE_DIR_$(UNAME_S))
$(if $(ALACRITTY_DOTFILE_DIR),,$(error "未定義 alacritty dotfile 資料夾"))
.PHONY: dotfiles-alacritty
dotfiles-alacritty: ## Deploy alacritty dotfiles (OS-specific)
	@echo "部署 Alacritty Dotfiles..."
	@echo "Deploy alacritty dotfiles from $(ALACRITTY_DOTFILE_DIR)"
	stow -vv -t $(HOME) $(ALACRITTY_DOTFILE_DIR)

RIME_CONFIG_DIR_Linux := $(HOME)/.config/ibus/rime
RIME_CONFIG_DIR_Darwin := $(HOME)/Library/Rime
RIME_CONFIG_DIR := $(RIME_CONFIG_DIR_$(UNAME_S))
$(if $(RIME_CONFIG_DIR),,$(error "未定義 rime config 資料夾"))
.PHONY: dotfiles-rime
dotfiles-rime: ## Deploy rime dotfiles (OS-specific)
	@echo "Deploy rime dotfiles to $(RIME_CONFIG_DIR)"
	stow -vv -t $(RIME_CONFIG_DIR) rime
