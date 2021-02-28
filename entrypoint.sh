#!/bin/sh -l

yarn

sh -c "node ./index.js $*"

# Zip
ls ./.ds
zip -r deploy-ds.zip ./.ds

# Deploy
mkdir -p $4
sshpass -p $2 scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /app/deploy-ds.zip $3@$1:$4
sshpass -p $2 ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $3@$1:$4 unzip -o $4/deploy-ds.zip -d $4
sshpass -p $2 ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $3@$1:$4 rm $4/deploy-ds.zip
sshpass -p $2 ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $3@$1:$4 'chmod +x /$4/cmd.sh && /$4/cmd.sh'