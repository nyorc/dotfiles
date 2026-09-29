# Dotfiles

nyorc 的 dotfiles，用在 macOS 跟 Debian 上

## 環境要求

- git, make, stow
- homebrew (macOS)
- apt (Debian)

### macOS

安裝 [homebrew](https://brew.sh/)
```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

安裝 git, make, stow
```bash
$ brew install git make stow
```

用 GNU make 取代內建的 make
```bash
$ PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
```

### Debian

安裝 git, make, stow
```bash
$ sudo apt update && sudo apt install -y git make stow
```

## 安裝 Dotfiles

Clone dotfiles 到 `~/.dotfiles`
```bash
$ git clone git@github.com:nyorc/dotfiles.git ~/.dotfiles
```

使用 make 部署設定：
- `make dotfiles`：部署全部
- `make dotfiles-<pkg>`：只部署單一套件
- `make help`：列出所有 target

## 專屬設定

有專屬特定電腦的設定不需進 git 的，可以放在以下的 local 檔案：
- `~/.zshrc.local`
- `~/.gitconfig.local`
- `~/.p10k.local.zsh`

## 參考資料

- https://brew.sh/
- https://www.gnu.org/software/stow/manual/stow.html

## 過去使用的工具

- [homemaker](https://github.com/FooSoft/homemaker): 作者停止維護。使用 TOML 定義部署很方便，但加入額外指令後反而變得過於複雜。
- Ansible: 幾乎可以處理所有工作的強大工具，但指令要找到對應的 module 並處理環境需求，維護成本過高。
