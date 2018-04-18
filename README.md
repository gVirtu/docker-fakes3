# docker-fakes3


A docker container for [fakes3](https://github.com/jubos/fake-s3) with the service exposed on port 10001 and a data volume at /fakes3_data

It's on [docker-hub](https://hub.docker.com/r/gvirtu/fakes3-alpine/) and [github](https://github.com/gVirtu/docker-fakes3)

## tags and links

 * `latest`, `1.2.1` [(Dockerfile)](https://github.com/gVirtu/docker-fakes3/blob/master/Dockerfile) [![](https://images.microbadger.com/badges/image/gvirtu/fakes3-alpine.svg)](https://microbadger.com/images/gvirtu/fakes3-alpine "Get your own image badge on microbadger.com") [![Build Status](https://travis-ci.org/gVirtu/docker-fakes3.svg?branch=master)](https://travis-ci.org/gVirtu/docker-fakes3)

## running

Get a list of available command line options
```sh
docker run -it --rm gvirtu/fakes3-alpine fakes3 --help
Commands:
  fakes3 help [COMMAND]                       # Describe available commands or one specific command
  fakes3 server \
         -p, --port=N \
         -r, --root=ROOT, \
         -h, --hostname=NAME                  # Run a server on a particular hostname
  fakes3 version                              # Report the current fakes3 version
```


Run the server with port 8000 exposed. In this mode, all data will be lost when the container terminates.
```sh
docker run -it --rm gvirtu/fakes3-alpine
```


To persist data on a host directory so it's saved across restarts just bind mount a host directory to /fakes3_data.
```sh
docker run -it --rm -v /host/s3_data:/fakes3_data:rw gvirtu/fakes3-alpine
```
