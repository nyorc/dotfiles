# 這裡放 stow 的組合指令
# - 要刪除時，請手動加上 -D 參數
# - 要測試時，請手動加上 -n 參數

UNAME_S := $(shell uname -s)
$(if $(UNAME_S),,$(error "未知的作業系統"))

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

ALACRITTY_DOTFILE_DIR_Darwin := alacritty-mac
ALACRITTY_DOTFILE_DIR_Linux  := alacritty-debian
ALACRITTY_DOTFILE_DIR      := $(ALACRITTY_DOTFILE_DIR_$(UNAME_S))
$(if $(ALACRITTY_DOTFILE_DIR),,$(error "未定義 alacritty dotfile 資料夾"))
dotfiles-alacritty:
	@echo "部署 Alacritty Dotfiles..."
	@echo "Deploy alacritty dotfiles from $(ALACRITTY_DOTFILE_DIR)"
	stow -vv -t $(HOME) $(ALACRITTY_DOTFILE_DIR)

RIME_CONFIG_DIR_Linux := $(HOME)/.config/ibus/rime
RIME_CONFIG_DIR_Darwin := $(HOME)/Library/Rime
RIME_CONFIG_DIR := $(RIME_CONFIG_DIR_$(UNAME_S))
$(if $(RIME_CONFIG_DIR),,$(error "未定義 rime config 資料夾"))
dotfiles-rime:
	@echo "Deploy rime dotfiles to $(RIME_CONFIG_DIR)"
	stow -vv -t $(RIME_CONFIG_DIR) rime

