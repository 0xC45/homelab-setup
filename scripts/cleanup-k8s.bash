#!/usr/bin/env bash

ansible \
  k8s \
  -i hosts.yml \
  --ask-vault-pass \
  --become \
  -a "/bin/bash -c 'kubeadm reset --force'"
