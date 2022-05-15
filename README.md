# Dotfiles

nyogjtrc's dotfiles. Managed by Homemaker, but now move on ansible

[TOC]

---

## Install dotfiles

### Get dotfiles repo

```
$ git clone git@github.com:nyogjtrc/dotfiles.git .dotfiles
```

### Install homemaker

```
$ ./installation/homemaker.sh
```

### Install dotfiles via Homemaker

```
$ ./dotfiles.sh
```

## Install Ansible

install pip3 then install ansible On Debian
```
$ sudo apt update
$ sudo apt install python3-pip
$ pip3 install ansible
```

---

## What's inside?

- configuration management: [Homemaker](//github.com/FooSoft/homemaker)
- vimrc
