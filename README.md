# Dotfiles

nyogjtrc's dotfiles.

manage dotfiles with Ansible, works with mac and ubuntu

[TOC]

---

## Install dotfiles

### Get dotfiles repo

```
$ git clone git@github.com:nyogjtrc/dotfiles.git .dotfiles
```

## Install Ansible

install pip3 then install ansible On Debian
```
$ sudo apt update
$ sudo apt install python3-pip
$ pip3 install ansible
```
## Usage

```
$ cd ansible
$ ansible-playbook dotfiles.yml
```
