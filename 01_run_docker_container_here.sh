#!/usr/bin/env sh

docker run -it --rm -v $(pwd):/home/kamping --shm-size=4gb ghcr.io/kamping-site/kamping-reproducibility:main
