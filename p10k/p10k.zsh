# Load customize p10k prompt based on OS
#

# base file
p10k_file=~/.dotfiles/p10k/p10k.mac.zsh

case "$(uname)" in
    Linux) p10k_file=~/.dotfiles/p10k/p10k.linux.zsh ;;
    Darwin|*) p10k_file=~/.dotfiles/p10k/p10k.mac.zsh ;;
esac

[[ -f $p10k_file ]] && source $p10k_file

# Load machine-specific overrides
[[ -f ~/.p10k.local.zsh ]] && source ~/.p10k.local.zsh
