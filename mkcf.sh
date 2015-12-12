#!/bin/bash

DOCKER_IMAGE='broadinstitute/pyplates:latest'
DOCKER_SOCKET='/var/run/docker.sock'
SUDO=

usage() {
    PROG=`basename $0`
    echo "usage: ${PROG} <template directory> <outfile>"
}

if [ "$TERM" != "dumb" ] ; then
    TTY='-it'
fi

if [ `uname -s` != "Darwin" ]; then
    if [ ! -w "${DOCKER_SOCKET}" ]; then
	SUDO='sudo'
    fi
fi

if [ -z "$1" ]; then
    usage
    exit 1
fi

if [ -z "$2" ]; then
    usage
    exit 2
fi

TEMPLATE_DIR="$( cd -P "$1" && pwd )"
if [ ! -d "${TEMPLATE_DIR}" ]; then
    echo "Directory `${TEMPLATE_DIR}` does not exist...exiting."
    exit 3
fi

templatefile="${TEMPLATE_DIR}/template.py"
if [ ! -f "${templatefile}" ]; then
    echo "Template file `${templatefile}` does not exist...exiting."
    exit 4
fi

$SUDO docker run $TTY --rm -v $TEMPLATE_DIR:/cfn $DOCKER_IMAGE cfn_py_generate /cfn/template.py > $2
