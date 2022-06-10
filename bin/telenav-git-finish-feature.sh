#!/bin/bash

#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#
#  © 2011-2021 Telenav, Inc.
#  Licensed under Apache License, Version 2.0
#
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

source telenav-library-functions.sh

#
# telenav-git-finish-feature.sh [scope] [branch-name]
#
# scope = { all, this, <family-name> }
#

if [[ ! "$#" -eq 2 ]]; then

    echo "telenav-git-finish-feature.sh [scope] [branch-name]"

fi

scope=$(repository_scope "$1")
branch_name=$2

cd_workspace
mvn --quiet "$scope" -Doperation=finish -Dbranch-type=feature -Dbranch-name="$branch_name" com.telenav.cactus:cactus-build-maven-plugin:pull || exit 1
