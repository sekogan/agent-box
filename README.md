# agent-box

Containerized launchers for terminal-based coding agents. Each agent runs in an isolated [Podman](https://podman.io/) container, mounting your current project as the workspace.

The container image is built automatically on first run and cached for subsequent runs. Each agent's configuration and credentials are mounted from the host so they persist across invocations.

## Installation

```sh
make install
```

This installs all agents. To install a specific agent:

```sh
make -C claude install
make -C copilot install
```

## Features

- **Isolation** — the agent runs in a container with access only to the current directory and its config, nothing else on the host.
- **Custom base images** — layer any agent on top of a Debian/Ubuntu or RHEL/Fedora/UBI image to provide the exact toolchain your project needs.
- **Per-project configuration** — commit a `.config/<agent>-box.conf` to pin the base image for a project (`<agent>-box init`).
- **SELinux-aware** — volume mounts are labelled correctly for SELinux hosts (Fedora, RHEL).

> [!WARNING]
> All agents run in **no-confirmation mode** (`--dangerously-skip-permissions` for Claude, `--yolo` for Copilot), meaning they execute commands without asking. The container limits the blast radius to the current directory, but it does **not** make this fully safe. Prompt injection attacks can still instruct the agent to exfiltrate the contents of your working directory.

## Agents

### [claude-box](claude/)

Runs [Claude Code](https://claude.ai/code). Mounts `~/.claude` and `~/.claude.json` from the host for session and config persistence.

```sh
claude-box                                   # launch in the current directory
claude-box init -b ghcr.io/myorg/dev:latest  # pin a custom base image
claude-box -C ~/projects/myapp               # launch in a specific directory
claude-box --rebuild                         # rebuild the container image
claude-box -- --model claude-opus-4-6        # pass arguments directly to claude
```

### [copilot-box](copilot/)

Runs [GitHub Copilot CLI](https://github.com/github/copilot.vim). Mounts `~/.copilot` from the host for authentication and config persistence.

```sh
copilot-box                                   # launch in the current directory
copilot-box init -b ghcr.io/myorg/dev:latest  # pin a custom base image
copilot-box -C ~/projects/myapp               # launch in a specific directory
copilot-box --rebuild                         # rebuild the container image
```
