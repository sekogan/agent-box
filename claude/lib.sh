TOOL_NAME="claude"
IMAGE_PREFIX="curb-claude"

get_extra_mounts() {
    # Mounting a non-existent file causes podman to create a directory instead.
    [[ ! -f "${HOME}/.claude.json" ]] && echo '{}' > "${HOME}/.claude.json"
    mkdir -p "${HOME}/.claude"
    EXTRA_MOUNTS+=(
        -v "${HOME}/.claude.json:/home/${USER_NAME}/.claude.json:z"
        -v "${HOME}/.claude:/home/${USER_NAME}/.claude:z"
    )
}
