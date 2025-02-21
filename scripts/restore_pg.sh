#!/usr/bin/env bash
set -e
# This is a simple script that restores a sql backup into local dev environment
#
# ex. > scripts/restore_pg.sh bugvault-dump.sql

echo "Restore data from pg_dump sql."
echo

FILENAME=${1:-bugvault-dump.sql}

podman cp "${FILENAME}" bugvault-data:.
podman exec bugvault-data psql -f "$(basename ${FILENAME})" -d bugvault
podman exec bugvault-data rm "$(basename ${FILENAME})"

# note the following is needed until design change to support arrays of acls in local_settings
read_acl=$(python3 manage.py shell --settings config.settings_local -c "from django.conf import settings;from bugvault.core import generate_acls;acls=generate_acls(settings.ALL_GROUPS);print(acls[0])")
write_acl=$(python3 manage.py shell --settings config.settings_local -c "from django.conf import settings;from bugvault.core import generate_acls;acls=generate_acls(settings.ALL_GROUPS);print(acls[1])")
echo "updating read acls"
podman exec bugvault-data psql -c "UPDATE bugvault_flaw SET acl_read=ARRAY['${read_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_affect SET acl_read=ARRAY['${read_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_flawmeta SET acl_read=ARRAY['${read_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_tracker SET acl_read=ARRAY['${read_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_flawacknowledgment SET acl_read=ARRAY['${read_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_flawcomment SET acl_read=ARRAY['${read_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_flawcvss SET acl_read=ARRAY['${read_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_flawreference SET acl_read=ARRAY['${read_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_package SET acl_read=ARRAY['${read_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_snippet SET acl_read=ARRAY['${read_acl}'::uuid];"

echo "updating read acls"
podman exec bugvault-data psql -c "UPDATE bugvault_flaw SET acl_write=ARRAY['${write_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_affect SET acl_write=ARRAY['${write_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_flawmeta SET acl_write=ARRAY['${write_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_tracker SET acl_write=ARRAY['${write_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_flawacknowledgment SET acl_read=ARRAY['${write_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_flawcomment SET acl_read=ARRAY['${write_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_flawcvss SET acl_read=ARRAY['${write_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_flawreference SET acl_read=ARRAY['${write_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_package SET acl_read=ARRAY['${write_acl}'::uuid];"
podman exec bugvault-data psql -c "UPDATE bugvault_snippet SET acl_read=ARRAY['${write_acl}'::uuid];"
