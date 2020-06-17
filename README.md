# Homelab Setup

This project is the "configuration as code" for my homelab environment. The project goal is to simplify management, updates, and configuration changes for every service running on my home network so that I don't get bogged down with day 2 operations (preventing me from focusing on my other projects). This document describes the steps required to (re)deploy each service from scratch.


## Table of Contents
1. [Router](#router)
1. [Gitea](#gitea)
1. [Nextcloud](#nextcloud)
1. [Harbor](#harbor)


## Router

1. Install OpenBSD 6.7
    - Enable SSH
1. Setup passwordless SSH
    ```
    mkdir ~/.ssh
    chmod 700 ~/.ssh
    vi ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    ```
1. Install Python
    ```
    pkg_add python-3.8.2
    ```
1. Run router Ansible role
    ```
    make router
    ```


## Gitea

1. Provision a VM
    - 1 CPU
    - 1 GB memory
    - 8 GB disk
1. Install Debian 10
    - Disable GUI
    - Disable print server
    - Enable SSH
1. Setup passwordless SSH
    ```
    mkdir ~/.ssh
    chmod 700 ~/.ssh
    nano ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    ```
1. Install sudo
    ```
    apt install sudo
    usermod -aG sudo <user>
    ```
1. Run gitea Ansible role
    ```
    make gitea
    ```
1. Create gitea user
    ```
    gitea --config /etc/gitea/app.ini admin create-user \
      --username <user> \
      --password password \
      --email <email> \
      --must-change-password \
      --admin
    ```
1. Log in, setup SSH keys, GPG keys, repos, etc.


## Nextcloud

1. Provision a VM
    - 1 CPU
    - 1 GB memory
    - 64 GB disk
1. Install Debian 10
    - Disable GUI
    - Disable print server
    - Enable SSH
1. Setup passwordless SSH
    ```
    mkdir ~/.ssh
    chmod 700 ~/.ssh
    nano ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    ```
1. Install sudo
    ```
    apt install sudo
    usermod -aG sudo <user>
    ```
1. Run nextcloud Ansible role
    ```
    make nextcloud
    ```
1. Complete installation with web UI
1. Install "Deck" App


## Harbor

1. Provision a VM
    - 2 CPU
    - 4 GB memory
    - 128 GB disk
1. Install Debian 10
    - Disable GUI
    - Disable print server
    - Enable SSH
1. Setup passwordless SSH
    ```
    mkdir ~/.ssh
    chmod 700 ~/.ssh
    nano ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    ```
1. Install sudo
    ```
    apt install sudo
    usermod -aG sudo <user>
    ```
1. Run harbor Ansible role
    ```
    make harbor
    ```
1. Log in to web UI and change admin password
1. Configure Docker client to trust private CA
    ```
    sudo mkdir -p /etc/docker/certs.d/harbor.mydomain.com/
    sudo vim /etc/docker/certs.d/harbor.mydomain.com/ca.crt
    ```
