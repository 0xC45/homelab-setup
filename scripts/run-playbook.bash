#!/usr/bin/env bash

case "${1}" in
"router") ;;
"gitea") ;;
"nextcloud") ;;
"harbor") ;;
"k8s") ;;
"octopi") ;;
"desktop") ;;
*)
  echo "error: specify service to configure (for example: ./scripts/run-playbook router)"
  exit 1
esac

ansible-playbook \
  -i hosts.yml \
  -l "${1}" \
  --ask-vault-pass \
  playbook.yml
