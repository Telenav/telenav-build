#!/bin/bash

#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#
#  © 2011-2021 Telenav, Inc.
#  Licensed under Apache License, Version 2.0
#
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

folders=()

source telenav-library-functions.sh

scope=$1

allowed_scopes=(all this kivakit mesakit lexakai cactus)

if [[ ! " ${allowed_scopes[*]} " == *" ${scope} "* ]]; then
    echo "Invalid scope"
    exit 1
fi

require_variable TELENAV_WORKSPACE "Must set TELENAV_WORKSPACE"
cd_workspace

lexakai()
{
    folder=$1
    cd "$TELENAV_WORKSPACE/$folder" || exit
    echo "┋ ================= Building $folder"
    mvn --no-transfer-progress \
        --batch-mode \
        --quiet \
        -Dsurefire.printSummary=false \
        -DKIVAKIT_LOG_LEVEL=Warning \
        -Dmaven.test.skip=true \
        -DKIVAKIT_DEBUG="!Debug" \
        --threads 12 \
        -Dcactus.verbose=true \
        -Dcactus.overwrite-resources=true \
        -Dcactus.update-readme=true \
        -Dcactus.lexakai-version=1.0.7 \
        -Dcactus.show-lexakai-output=true \
        com.telenav.cactus:cactus-maven-plugin:1.4.12:lexakai || exit 1
}

build_lexakai_documentation()
{
    scope=$1

    scoped_folders "$scope"
    for folder in "${folders[@]}";
    do
        lexakai "$folder"
    done
}

build_lexakai_documentation "$scope"
