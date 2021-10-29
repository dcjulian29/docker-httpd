@echo off
setlocal
set THTTPD_VERSION=2.29

docker build --pull --progress plain -t dcjulian29/httpd:%THTTPD_VERSION% . ^
  --build-arg THTTPD_VERSION=%THTTPD_VERSION%

docker tag dcjulian29/httpd:%THTTPD_VERSION%  dcjulian29/httpd:latest

if "%1" == "" GOTO :EOF

echo --------------------------------------------------------------------------

docker push dcjulian29/httpd --all-tags
