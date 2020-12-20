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

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
