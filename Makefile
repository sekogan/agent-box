SHARE_DIR := $(HOME)/.local/share/agent-box
AGENTS    := claude copilot

.PHONY: install _install_common $(AGENTS)

install: _install_common $(AGENTS)

_install_common:
	install -d $(SHARE_DIR)
	install -m 644 Dockerfile.common $(SHARE_DIR)/Dockerfile.common

$(AGENTS):
	$(MAKE) -C $@ install
