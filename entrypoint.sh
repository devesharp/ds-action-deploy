#!/bin/sh -l

ls
sh -c "node ./index.js $*"

# ls ./.ds
# zip -r deploy-ds.zip ./.ds

# echo "$5"