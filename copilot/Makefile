BIN_DIR    := $(HOME)/.local/bin
SHARE_DIR  := $(HOME)/.local/share/agent-box
CONFIG_DIR := $(HOME)/.config
TOOL       := copilot

.PHONY: install

install:
	install -d $(SHARE_DIR)/$(TOOL)
	install -m 644 lib.sh $(SHARE_DIR)/$(TOOL)/lib.sh
	install -m 644 Dockerfile $(SHARE_DIR)/$(TOOL)/Dockerfile
	@[ -f $(CONFIG_DIR)/agent-box.conf ] \
		&& echo "Skipping $(CONFIG_DIR)/agent-box.conf (already exists)" \
		|| (cd $(HOME) && $(BIN_DIR)/agent-box init)
	@echo "Installed $(TOOL) to $(SHARE_DIR)/$(TOOL)"
