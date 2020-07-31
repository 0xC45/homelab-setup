#!/usr/bin/env bash

k8s_cleanup_cmd="kubeadm reset --force && "
k8s_cleanup_cmd+="rm -rf /etc/cni/net.d && "
k8s_cleanup_cmd+="iptables -P INPUT ACCEPT && "
k8s_cleanup_cmd+="iptables -P FORWARD ACCEPT && "
k8s_cleanup_cmd+="iptables -P OUTPUT ACCEPT && "
k8s_cleanup_cmd+="iptables -t nat -F && "
k8s_cleanup_cmd+="iptables -t mangle -F && "
k8s_cleanup_cmd+="iptables -F && "
k8s_cleanup_cmd+="iptables -X && "
k8s_cleanup_cmd+="iptables-legacy -P INPUT ACCEPT && "
k8s_cleanup_cmd+="iptables-legacy -P FORWARD ACCEPT && "
k8s_cleanup_cmd+="iptables-legacy -P OUTPUT ACCEPT && "
k8s_cleanup_cmd+="iptables-legacy -t nat -F && "
k8s_cleanup_cmd+="iptables-legacy -t mangle -F && "
k8s_cleanup_cmd+="iptables-legacy -F && "
k8s_cleanup_cmd+="iptables-legacy -X && "
k8s_cleanup_cmd+="ip6tables -P INPUT ACCEPT && "
k8s_cleanup_cmd+="ip6tables -P FORWARD ACCEPT && "
k8s_cleanup_cmd+="ip6tables -P OUTPUT ACCEPT && "
k8s_cleanup_cmd+="ip6tables -t nat -F && "
k8s_cleanup_cmd+="ip6tables -t mangle -F && "
k8s_cleanup_cmd+="ip6tables -F && "
k8s_cleanup_cmd+="ip6tables -X && "
k8s_cleanup_cmd+="ip6tables-legacy -P INPUT ACCEPT && "
k8s_cleanup_cmd+="ip6tables-legacy -P FORWARD ACCEPT && "
k8s_cleanup_cmd+="ip6tables-legacy -P OUTPUT ACCEPT && "
k8s_cleanup_cmd+="ip6tables-legacy -t nat -F && "
k8s_cleanup_cmd+="ip6tables-legacy -t mangle -F && "
k8s_cleanup_cmd+="ip6tables-legacy -F && "
k8s_cleanup_cmd+="ip6tables-legacy -X"

ansible \
  k8s \
  -i hosts.yml \
  --ask-vault-pass \
  --become \
  -a "/bin/bash -c '${k8s_cleanup_cmd}'"
