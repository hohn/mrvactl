# graph.sh — declarative only, no side effects

# | Class    | Started here | Probed here | Owned here |
# | -------- | ------------ | ----------- | ---------- |
# | MRVA_INFRA    | yes          | yes         | yes        |
# | MRVA_WORKERS  | yes          | yes         | yes        |
# | CLIENTS  | yes          | yes/no      | yes        |
# | EXTERNAL | no           | yes         | no         |

# Services not started by orchestration
EXTERNAL="hepc"

# Services that must be present at startup
REQUIRED="rabbitmq postgres minio agent server"

# Services that may be absent at startup
OPTIONAL="hepc"


MRVA_INFRA="hepc rabbitmq postgres minio"
MRVA_WORKERS="agent server"
CLIENTS="ghmrva"

MRVA_GROUPS="MRVA_INFRA MRVA_WORKERS CLIENTS"

# Meaning: left depends on right
DEPS="
workers infra
clients workers
"
