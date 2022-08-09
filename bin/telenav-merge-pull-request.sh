#!/bin/bash

#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#
#  © 2011-2021 Telenav, Inc.
#  Licensed under Apache License, Version 2.0
#
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

source telenav-library-functions.sh

if [[ -z "$TELENAV_GIT_AUTHENTICATION_TOKEN" ]]; then

    echo "Must set TELENAV_GIT_AUTHENTICATION_TOKEN environment variable to merge pull requests"
    exit 1

fi

if [[ "$#" -eq 0 ]]; then

    branch_name=$(branch_name "$TELENAV_WORKSPACE/kivakit")

elif [[ "$#" -eq 1 ]]; then

    branch_name=$1

else

    usage "[branch_name]?"

fi

cactus_all git-merge-pull-request \
    -Dcactus.authentication-token="$TELENAV_GIT_AUTHENTICATION_TOKEN" \
    -Dcactus.branch-name="$branch_name" || exit 1
