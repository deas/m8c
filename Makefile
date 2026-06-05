.DEFAULT_GOAL := help
HELP-DESCRIPTION-SPACING := 24

.PHONY: ansible-init ansible-play ansible-apt-update ansible-inventory-show lint fmt help generate-docs

# SSH_PRIVATE_KEY=$$HOME/.ssh/id_rsa.contentreich-automation

include include/default.mk
include include/gcp.mk

init-macos: ## Prepare Mac OS for ansible development
	xcode-select --install # Needs graphical UI
	./bin/m8c-init-devops

# Run the following command to add Python 3 to your $PATH: export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"
ansible-setup-macos: ## Setup Ansible so you can run it locally on Mac OS
	sudo pip3 install --upgrade pip
	pip3 install ansible

ansible-init: ## Install ansible requirements
	ansible-galaxy install --force -r requirements.yml

ansible-playbook-check: ## Run ansible playbook check
	ansible-playbook --check main.yml

ansible-play: ## Run ansible playbook
	ansible-playbook main.yml
# -vvvv

ansible-play-at: ## Run ansible playbook starting at task
	ansible-playbook main.yml --start-at-task="$(TASK)" # --step

ansible-inventory-show: ## Show ansible inventory
	ansible-inventory --vars --host $(INCUS_NAME)
# ansible-inventory --graph --vars

ansible-apt-update: ## Run apt-get upgrade
	ansible all -m apt -a "upgrade=yes update_cache=yes cache_valid_time=86400" --become

ansible-doc-list: ## List ansible modules
	ansible-doc -l

ansible-lint: ## Ansible lint
	ansible-lint -c .ansible-lint --offline --nocolor main.yml

ansible-syntax-check: ## Check ansible syntax
	ansible-playbook --syntax-check main.yml

ansible-preflight: ansible-syntax-check ansible-playbook-check ## Ansible preflight before commit

.PHONY: preflight
preflight: shell-preflight ansible-preflight ## Preflight before commit

.PHONY: shell-preflight
shell-preflight: shell-fmt shell-lint shell-test  ## Shell preflight before commit

shell-fmt: ## Format shell scripts
	shfmt -i 2 -w bin/

shell-lint: ## Lint shell scripts
	shellcheck bin/*

shell-test: ## Run shell tests
	if [ -d "tests" ] ; then bats tests/; fi

