# develop.zsh
# develop env configuration

# set golang env
if [ -d "/usr/local/go/" ]; then
    export PATH="$PATH:/usr/local/go/bin"
    export PATH="$PATH:$(go env GOPATH)/bin"
    export GO111MODULE=on
fi
if [ -e "/usr/local/bin/go" ]; then
    export PATH="$PATH:$(go env GOROOT)/bin"
    export PATH="$PATH:$(go env GOPATH)/bin"
    export GO111MODULE=on
fi

# set composer env
if [ -d "$HOME/.config/composer/vendor/bin/" ]; then
    export PATH=$PATH:$HOME/.config/composer/vendor/bin/
fi

# set nvm env
if [ -d "$HOME/.nvm/" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

if [ -e "/usr/local/bin/terraform" ]; then
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C /usr/local/bin/terraform terraform
fi

if [ -d "$HOME/.local/bin/" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi
