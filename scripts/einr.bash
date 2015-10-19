#!/bin/bash
# Execute If Not Running
# for general purpose launching of applications but checking if they are 
# already running first as to not potentially have 2 instances of an 
# application running for example xcompmgr

if [[ -z $1 ]]; then
    printf "Must supply name of command to execute:\nExample: ./$0 rsync\n"
    exit 1
fi

if [[ $(which $1) ]]; then
    if [[ -z $(pidof $1) ]]; then
        $1 
    fi
fi
