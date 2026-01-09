# build.sh — declarative build inventory
# No execution. No ordering logic.

# Core builds (default)
CORE_BUILDS="
build-agent.sh
build-ghmrva.sh
build-server.sh
build-hepc.sh
"

# Deprecated / retained for reference
DEPRECATED_BUILDS="
build-vscode.sh
"

# Builds required only for full deployment
FULL_ONLY_BUILDS="
"
