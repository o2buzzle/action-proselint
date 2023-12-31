# Container image that runs your code
FROM debian:latest
RUN apt-get update && apt-get install -y python3-proselint git
RUN apt-get clean && apt-get autoclean

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
