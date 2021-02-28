#!/bin/sh -l

ls
ls ./node_modules
sh -c "node ./index.js $*"

# ls ./.ds
# zip -r deploy-ds.zip ./.ds

# echo "$5"