#!/bin/bash

set -e

cat <<EOF > /etc/ente/museum.yaml
key:
  encryption: "$ENCRYPTION_KEY"
  hash: "$HASH_KEY"
jwt:
  secret: "$JWT_SECRET"
db:
  host: postgres
  port: 5432
  name: "$DB_NAME"
  user: "$DB_USER"
  password: "$DB_PASSWORD"
s3:
  are_local_buckets: true
  b2-eu-cen:
    key: "$S3_ACCESS_KEY"
    secret: "$S3_SECRET_KEY"
    endpoint: minio:3200
    region: eu-central-2
    bucket: b2-eu-cen
  wasabi-eu-central-2-v3:
    key: "$S3_ACCESS_KEY"
    secret: "$S3_SECRET_KEY"
    endpoint: minio:3200
    region: eu-central-2
    bucket: wasabi-eu-central-2-v3
    compliance: false
  scw-eu-fr-v3:
    key: "$S3_ACCESS_KEY"
    secret: "$S3_SECRET_KEY"
    endpoint: minio:3200
    region: eu-central-2
    bucket: scw-eu-fr-v3
EOF

# Run Museum
exec ./museum --config /etc/ente/museum.yaml
