FROM ubuntu

# Install components required by ArmA3Sync.
RUN apt-get update && apt-get install -y \
  ciopfs \
  fuse \
  openjdk-9-jre

WORKDIR /opt/arma3

ADD start.sh start.sh
ADD arma3sync arma3sync

# Run ArmA3Sync.
ENTRYPOINT ["/bin/bash", "start.sh"]
