#!/usr/bin/env bash

upgrade_cmd="/bin/bash -c 'sudo apt-mark unhold kubelet kubeadm kubectl && "
upgrade_cmd+="sudo apt-get update && "
upgrade_cmd+="sudo apt-get upgrade -y kubelet kubeadm kubectl && "
upgrade_cmd+="sudo apt-mark hold kubelet kubeadm kubectl'"

ansible \
  k8s \
  -i hosts.yml \
  --ask-vault-pass \
  --become \
  -a "${upgrade_cmd}"
