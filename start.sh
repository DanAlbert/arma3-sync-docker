#!/bin/bash
set -e
set -x


if [ -z "$A3SYNC_URL" ]; then
  >&2 echo "A3SYNC_URL is not set"
  exit 1
fi
if [ -z "$A3SYNC_SCHEME" ]; then
  >&2 echo "A3SYNC_SCHEME is not set"
  exit 1
fi
if [ -z "$A3SYNC_PORT" ]; then
  >&2 echo "A3SYNC_PORT is not set"
  exit 1
fi
if [ -z "$A3SYNC_USER" ]; then
  >&2 echo "A3SYNC_USER is not set"
  exit 1
fi
if [ -z "$A3SYNC_PASS" ]; then
  >&2 echo "A3SYNC_PASS is not set"
  exit 1
fi

mkdir -p /arma3/mods

# https://community.bistudio.com/wiki/Arma_3_Dedicated_Server#Case_sensitivity_.26_Mods
mkdir -p /arma3/mods_sync
ciopfs /arma3/mods /arma3/mods_sync

cat << EOF > mods_script.txt
NEW
mods
$A3SYNC_SCHEME
$A3SYNC_PORT
$A3SYNC_USER
$A3SYNC_PASS
$A3SYNC_URL
/arma3/mods_sync
SYNC
mods
/arma3/mods_sync
yes
quit
EOF

(cd arma3sync && ./ArmA3Sync-console.sh < ../mods_script.txt)

fusermount -u /arma3/mods_sync
