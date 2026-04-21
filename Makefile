AGENTS := claude copilot

.PHONY: install $(AGENTS)

install: $(AGENTS)

$(AGENTS):
	$(MAKE) -C $@ install
