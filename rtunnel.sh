#!/bin/sh
# revers forward ssh connection to my home machine
# auto restarts if needed

ruser=${USER}
rhost=homestation
opts="-f -T -N -R *:2022:localhost:22 ${ruser}@${rhost}"

function SSH {
    while true; do
        ssh $opts
        echo "created reverse tunnel to ${rhost}:2022"
        sleep 5
    done
}
function AUTO_SSH {
    autossh -M 0 $opts
}

AUTO_SSH
