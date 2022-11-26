# Dotfiles

nyogjtrc's dotfiles.

manage dotfiles with Ansible, works with mac and ubuntu

[TOC]

---

## Requirements

- homebrew (mac)
- git
- ansible

### Mac
install homebrew on mac
```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

install git on mac
```bash
$ brew install git
```

install ansible on mac
```bash
$ brew install ansible
```

### Debian / Ubuntu

install git
```bash
$ sudo apt install git
```

install ansible on debian/ubuntu
```bash
$ sudo apt install python3-pip
$ pip3 install ansible
```

## Install dotfiles

clone dotfiles repo
```bash
$ git clone git@github.com:nyogjtrc/dotfiles.git .dotfiles
```

## Usage

```bash
$ cd ansible
$ ansible-playbook dotfiles.yml
```

## Reference

- https://brew.sh/
