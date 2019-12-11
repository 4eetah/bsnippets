#!/bin/sh
pushd $PWD

trap SIGINT_handler INT

function SIGINT_handler() {
    kill $tunnelPID    
}

port=9999
bind_address=localhost

ssh workstation -D ${bind_address}:${port} -N &
tunnelPID=$!
sleep 1
echo git -c http.proxy=socks5://${bind_address}:${port} $*
git -c http.proxy=socks5://${bind_address}:${port} $@
kill $tunnelPID
popd
