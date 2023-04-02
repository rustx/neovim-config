default: install

V = 0
Q = $(if $(filter 1,$V),,@)
M = $(shell printf "\033[34;1m▶\033[0m")

# Make is verbose in Linux. Make it silent.
MAKEFLAGS += --silent

# Local binary path for installation
BIN_PATH := $(HOME)/.local/bin

# Installation command
define install_cmd
	if [ "$(*)" = "terraform-ls" ]; then \
		curl -sS https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/hashicorp-archive-keyring.gpg &&\
		echo "deb https://apt.releases.hashicorp.com $(shell lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list && \
		sudo apt update && \
		sudo apt install terraform-ls; \
	elif [ "$(*)" = "jedi-language-server" ]; then \
		sudo apt update && sudo apt install python3.10-venv &&\
		pip install -U $(*); \
	elif [ "$(*)" = "golangci-lint" ]; then \
		curl -sSfL https://raw.githubusercontent.com/golangci/$(*)/master/install.sh | sh -s -- -b $(shell go env GOPATH)/bin v1.52.2; \
	fi
endef

## install: Install Language Servers
install: install/terraform-ls install/jedi-language-server install/golangci-lint

install/%:
	$(info $(M) installing $*...)
	cd $(TEMP_DIR) &&\
	if [ "$(*)" = "terraform-ls" ]; then \
		$(call install_cmd,$(*)); \
	elif [ "$(*)" = "jedi-language-server" ]; then \
		$(call install_cmd,$(*)); \
	elif [ "$(*)" = "golangci-lint" ]; then \
		$(call install_cmd,$(*)); \
	fi
	$(info $(O) $(*) installed successfully...)

.PHONY: help
help: Makefile
	@echo
	@echo " Choose a command run in "$(PROJECT_NAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
