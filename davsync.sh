#!/bin/bash

ROOT_DIRECTORY=/var/www
LOCAL_PROD_DIR=/proddir
LOCAL_TEST_DIR=/testdir
LOCAL_DEV_DIR=/devdir

PROD_DIR=/var/www/prod
TEST_DIR=/var/www/test
DEV_DIR=/var/www/dev

DOMAIN="domain.com"

if [[ $PWD != $ROOT_DIRECTORY$LOCAL_PROD_DIR/* && $PWD != $ROOT_DIRECTORY$LOCAL_DEV_DIR/* ]]; then
    echo "You can't do that here."
    exit 1
fi

if [[ $PWD == $ROOT_DIRECTORY$LOCAL_PROD_DIR/* ]]; then
    echo "Production"
    local_env_dir=$LOCAL_PROD_DIR
    env_dir=$PROD_DIR
elif [[ $PWD == $ROOT_DIRECTORY$LOCAL_TEST_DIR/* ]]; then
    echo "Testing"
    local_env_dir=$LOCAL_TEST_DIR
    env_dir=$TEST_DIR
elif [[ $PWD == $ROOT_DIRECTORY$LOCAL_DEV_DIR/* ]]; then
    echo "Development"
    local_env_dir=$LOCAL_DEV_DIR
    env_dir=$DEV_DIR
fi

path=${PWD#$ROOT_DIRECTORY$local_env_dir}
remote_path="${DOMAIN}:${env_dir}${path}/*"
echo $remote_path

rsync -avzP $remote_path .
exit 0
