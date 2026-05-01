BIN_DIR   := $(HOME)/.local/bin
SHARE_DIR := $(HOME)/.local/share/curb
TOOLS     := claude copilot

.PHONY: install _install_common $(TOOLS)

install: _install_common $(TOOLS)

_install_common:
	install -d $(BIN_DIR) $(SHARE_DIR)
	install -m 755 curb $(BIN_DIR)/curb
	install -m 644 Dockerfile.common $(SHARE_DIR)/Dockerfile.common

$(TOOLS):
	$(MAKE) -C $@ install
