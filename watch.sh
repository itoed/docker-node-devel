#!/bin/bash

while true ; do
    inotifywait -r -e modify,attrib,move,create,delete /home/developer/app && \
    npm install --prefix /home/developer/app && \
    pm2 restart all
done
