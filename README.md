# Custom Node.js Docker Image with SSH Server

This is a custom Docker image derived from [itoed/node](https://registry.hub.docker.com/u/itoed/node/).

It is intended for remote development of Node.js applications and can only be
accessed by SSH with the matching private RSA key `developer_id_rsa`.

As part a the workflow, `/home/developer/app/` can be transferred using rsync over ssh,
and the watch script will tell PM2 to restart the application. E.g.:

    rsync -avz --delete -e "ssh -i ~/.ssh/developer_id_rsa" \
        --exclude "*.sw[op]" \
        --exclude "node_modules*" \
        app/ developer@example.com:app/
