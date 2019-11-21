#!/bin/sh
pushd $PWD

port=9999
bind_address=localhost

ssh workstation -D ${bind_address}:${port} -N &
sleep 1
echo git -c http.proxy=socks5://${bind_address}:${port} $*
git -c http.proxy=socks5://${bind_address}:${port} $*
kill $!
popd
