@echo off
setlocal

pushd %~dp0

for /f "delims=" %%x in (version) do set THTTPD_VERSION=%%x

docker build --build-arg THTTPD_VERSION=%THTTPD_VERSION% --progress plain ^
  -t dcjulian29/httpd:%THTTPD_VERSION% .

if %errorlevel% neq 0 popd;exit /b %errorlevel%

popd

docker tag dcjulian29/httpd:%THTTPD_VERSION%  dcjulian29/httpd:latest
