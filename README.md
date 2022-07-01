# A Docker Container for Tiny HTTPD Server

[![Docker Pulls](https://img.shields.io/docker/pulls/dcjulian29/httpd.svg)](https://hub.docker.com/r/dcjulian29/httpd/) [![Docker Stars](https://img.shields.io/docker/stars/dcjulian29/httpd.svg?maxAge=2592000)](https://hub.docker.com/r/dcjulian29/httpd/) [![GitHub Issues](https://img.shields.io/github/issues-raw/dcjulian29/docker-httpd.svg)](https://github.com/dcjulian29/docker-httpd/issues) [![CI](https://github.com/dcjulian29/docker-httpd/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/dcjulian29/docker-httpd/actions/workflows/ci.yml) [![Release Image](https://github.com/dcjulian29/docker-httpd/actions/workflows/release.yml/badge.svg)](https://github.com/dcjulian29/docker-httpd/actions/workflows/release.yml)

Sometimes I just need to expose a bunch of files/folders to a network via http. This container is just a simple static compiled THTTPD that hosts the volume provided. I use this in Kubernetes Clusters for centralized configurations, local APT mirrors, "public" file shares for local networks, and as a software distribution endpoint.

To use:

    docker run -d -e TZ=America/New_York -v ~/downloads:/www:ro -p 8000:3000 dcjulian29/httpd
