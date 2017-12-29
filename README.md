# ArmA3Sync Docker
Docker container for running ArmA3Sync.

```bash
# Must be run in priviledged mode for FUSE.
docker run -it danalbert/arma3-sync \
  --priviledged \
  -e A3SYNC_URL=$URL \
  -e A3SYNC_SCHEME=$SCHEME \
  -e A3SYNC_PORT=$PORT \
  -e A3SYNC_USER=$USER \
  -e A3SYNC_PASS=$PASS \
  -v /opt/arma3:/arma3:rw
```
