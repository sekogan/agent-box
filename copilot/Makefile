BIN_DIR    := $(HOME)/.local/bin
SHARE_DIR  := $(HOME)/.local/share/curb
CONFIG_DIR := $(HOME)/.config
TOOL       := copilot

.PHONY: install

install:
	install -d $(SHARE_DIR)/$(TOOL)
	install -m 644 lib.sh $(SHARE_DIR)/$(TOOL)/lib.sh
	install -m 644 Dockerfile $(SHARE_DIR)/$(TOOL)/Dockerfile
	@[ -f $(CONFIG_DIR)/curb.conf ] \
		&& echo "Skipping $(CONFIG_DIR)/curb.conf (already exists)" \
		|| (cd $(HOME) && $(BIN_DIR)/curb init)
	@echo "Installed $(TOOL) to $(SHARE_DIR)/$(TOOL)"
