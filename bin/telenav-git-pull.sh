#!/bin/bash

#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#
#  © 2011-2021 Telenav, Inc.
#  Licensed under Apache License, Version 2.0
#
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

source telenav-library-functions.sh

#
# telenav-git-pull.sh [scope]?
#
# scope = { all, this, [family-name] }
#

scope=$(resolve_scope "$1")

cd_workspace
mvn --quiet "$scope" com.telenav.cactus:cactus-build-maven-plugin:pull || exit 1
