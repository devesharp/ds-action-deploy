#!/bin/sh -l

yarn

sh -c "node ./index.js $*"

# ls ./.ds
# zip -r deploy-ds.zip ./.ds

# echo "$5"