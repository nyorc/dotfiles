# Load shared p10k prompt, then OS-specific overrides
#
# p10k.base.zsh is wizard output kept verbatim so `p10k configure` can
# regenerate it; per-OS differences live in the small override files.

source ~/.dotfiles/p10k/p10k.base.zsh

case $OSTYPE in
    darwin*) source ~/.dotfiles/p10k/p10k.mac.zsh ;;
    linux*)  source ~/.dotfiles/p10k/p10k.linux.zsh ;;
esac

# Load machine-specific overrides
[[ -f ~/.p10k.local.zsh ]] && source ~/.p10k.local.zsh
