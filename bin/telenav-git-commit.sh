#!/bin/bash

#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#
#  © 2011-2021 Telenav, Inc.
#  Licensed under Apache License, Version 2.0
#
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

source telenav-library-functions.sh

#
# telenav-git-commit.sh [message]?
#

#
# Get message
#

message=$1

if [[ "$message" == "" ]]; then

    read -p "Commit message? " -r
    message=$REPLY

fi

#
# Commit
#

cd_workspace
scope=$(scope)
echo mvn --quiet "$scope" -Dtelenav.commit-message=\""$message"\" -Dtelenav.update-root=true com.telenav.cactus:cactus-build-maven-plugin:commit || exit 1
