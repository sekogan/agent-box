BIN_DIR    := $(HOME)/.local/bin
SHARE_DIR  := $(HOME)/.local/share/agent-box
CONFIG_DIR := $(HOME)/.config

.PHONY: install

install:
	install -d $(BIN_DIR)
	install -d $(SHARE_DIR)
	install -m 755 copilot-box $(BIN_DIR)/copilot-box
	install -m 644 Dockerfile $(SHARE_DIR)/Dockerfile.copilot
	@[ -f $(CONFIG_DIR)/copilot-box.conf ] \
		&& echo "Skipping $(CONFIG_DIR)/copilot-box.conf (already exists)" \
		|| (cd $(HOME) && $(BIN_DIR)/copilot-box init)
	@echo "Installed copilot-box to $(BIN_DIR)/copilot-box"
	@echo "Make sure $(BIN_DIR) is in your PATH."
