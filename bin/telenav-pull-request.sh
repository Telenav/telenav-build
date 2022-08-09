#!/bin/bash

#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#
#  © 2011-2021 Telenav, Inc.
#  Licensed under Apache License, Version 2.0
#
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

source telenav-library-functions.sh

if [[ -z "$TELENAV_GIT_AUTHENTICATION_TOKEN" ]]; then

    echo "Must set TELENAV_GIT_AUTHENTICATION_TOKEN environment variable to create pull requests"
    exit 1

fi

if [[ "$#" -eq 1 ]]; then

    branch_name=$1

elif [[ "$#" -eq 0 ]]; then

    branch_name=$(git_branch_name "$TELENAV_WORKSPACE/kivakit")

else

    usage "[branch-name]?"

fi

read -p -r "Title? "
title=$REPLY
read -p -r "Body? "
body=$REPLY

cactus_all git-pull-request \
    -Dcactus.authentication-token="$TELENAV_GIT_AUTHENTICATION_TOKEN" \
    -Dcactus.title="$title" \
    -Dcactus.to-branch="develop-snapshot" \
    -Dcactus.from-branch="$branch_name" \
    -Dcactus.body="$body" \
    -Dcactus.reviewers="rodherz,sunshine-syz,timboudreau,wenjuanj,jonathanl-telenav,haifeng-z" || exit 1
