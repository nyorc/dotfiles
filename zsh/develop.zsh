# develop.zsh
# develop env configuration

# set golang env
if [ -d "/usr/local/go/" ]; then
    export PATH="$PATH:/usr/local/go/bin"
    export PATH="$PATH:$(go env GOPATH)/bin"
    export GO111MODULE=on
fi

# set golang env in brew install position
if [ -e "/opt/homebrew/bin/go" ]; then
    export PATH="$PATH:$(go env GOPATH)/bin"
    export GO111MODULE=on
fi

# set composer env
if [ -d "$HOME/.config/composer/vendor/bin" ]; then
    if ! [[ ":$PATH:" =~ ":$HOME/.config/composer/vendor/bin:" ]]; then
        PATH="$HOME/.config/composer/vendor/bin:$PATH"
    fi
fi

if [ -e "/usr/local/bin/terraform" ]; then
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C /usr/local/bin/terraform terraform
fi

if [ -d "$HOME/.local/bin" ]; then
    if ! [[ ":$PATH:" =~ ":$HOME/.local/bin:" ]]; then
        PATH="$HOME/.local/bin:$PATH"
    fi
fi

# set nodenv env
if [[ -s ~/.nodenv/bin/nodenv ]]; then
    eval "$(~/.nodenv/bin/nodenv init - --no-rehash zsh)"
fi

if (( $+commands[gcloud] )); then
    # enable zsh completion for gcloud
    if [[ -d "$(brew --prefix)/share/google-cloud-sdk/" ]]; then
        # brew already set the path
        # source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
        source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
    fi

    # Increasing the IAP TCP upload bandwidth
    # https://cloud.google.com/iap/docs/using-tcp-forwarding#increasing_the_tcp_upload_bandwidth
    export CLOUDSDK_PYTHON_SITEPACKAGES=1
fi
