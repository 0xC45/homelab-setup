HOSTS_FILE := hosts.yml

%:
	HOSTS_FILE=$(HOSTS_FILE) ./scripts/run-playbook.bash $@
