#!/bin/bash
set -e

echo "🗃 Restoring database from compressed dump..."

# Decompress and load dump into the default DB
gunzip -c /docker-entrypoint-initdb.d/db_dump.sql.gz | psql -U "$POSTGRES_USER" -d "$POSTGRES_DB"

echo "✅ Database restored."
