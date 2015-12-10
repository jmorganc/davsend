#!/bin/bash

ROOT_DIRECTORY=/var/www
PROD_DIR=/proddir
TEST_DIR=/testdir
DEV_DIR=/devdir

DOMAIN="domain.com"
PROD_DAV="proddav"
TEST_DAV="testdav"
DEV_DAV="devdav"

if [[ $PWD != $ROOT_DIRECTORY$PROD_DIR/* && $PWD != $ROOT_DIRECTORY$DEV_DIR/* ]]; then
    echo "You can't do that here."
    exit 1
fi

if [[ $PWD == $ROOT_DIRECTORY$PROD_DIR/* ]]; then
    echo "Production"
    env_dir=$PROD_DIR
    env_dav=$PROD_DAV
elif [[ $PWD == $ROOT_DIRECTORY$TEST_DIR/* ]]; then
    echo "Testing"
    env_dir=$TEST_DIR
    env_dav=$TEST_DAV
elif [[ $PWD == $ROOT_DIRECTORY$DEV_DIR/* ]]; then
    echo "Development"
    env_dir=$DEV_DIR
    env_dav=$DEV_DAV
fi

path=${PWD#$ROOT_DIRECTORY$env_dir}
remote_path="https://${env_dav}.${DOMAIN}${path}/$1"
echo $remote_path

curl --user $USER -T $1 $remote_path
exit 0
