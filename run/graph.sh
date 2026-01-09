# graph.sh — declarative only, no side effects

# Services that must be present at startup
REQUIRED="rabbitmq postgres minio agent server"

MRVA_INFRA="hepc rabbitmq postgres minio"
MRVA_WORKERS="agent server"
CLIENTS="ghmrva"

MRVA_GROUPS="MRVA_INFRA MRVA_WORKERS CLIENTS"

# Meaning: left depends on right
DEPS="
workers infra
clients workers
"
