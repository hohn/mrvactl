# env.sh — canonical single-host environment for MRVA
# Declarative only. No side effects.

# RabbitMQ
export MRVA_RABBITMQ_HOST=mrva-rabbitmq
export MRVA_RABBITMQ_PORT=5672
export MRVA_RABBITMQ_USER=user
export MRVA_RABBITMQ_PASSWORD=password

# MinIO
export MINIO_DOMAIN=minio.store
export MINIO_ROOT_USER=user
export MINIO_ROOT_PASSWORD=mmusty8432

export ARTIFACT_MINIO_ENDPOINT=mrvastore:9000
export ARTIFACT_MINIO_ID=$MINIO_ROOT_USER
export ARTIFACT_MINIO_SECRET=$MINIO_ROOT_PASSWORD

export QLDB_MINIO_ENDPOINT=mrvastore:9000
export QLDB_MINIO_ID=$MINIO_ROOT_USER
export QLDB_MINIO_SECRET=$MINIO_ROOT_PASSWORD
export MRVA_MINIO_VIRTUAL_HOST=0

# HEPC (experimental)
export MRVA_HEPC_DATAVIACLI=0
export MRVA_HEPC_REFROOT=/refroot/
export MRVA_HEPC_OUTDIR=WedMay7
export MRVA_HEPC_TOOL=codeql-javascript
export MRVA_HEPC_COMMAND=spigot-cli

export MRVA_HEPC_CACHE_DURATION=0
export MRVA_HEPC_ENDPOINT=http://host.docker.internal:8070

export POSTGRES_USER=mrva
export POSTGRES_PASSWORD=mrvapg
export POSTGRES_DB=mrvadb
export POSTGRES_HOST=postgres
export POSTGRES_PORT=5432
