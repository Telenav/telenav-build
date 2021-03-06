#!/bin/bash

#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#
#  © 2011-2021 Telenav, Inc.
#  Licensed under Apache License, Version 2.0
#
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

source telenav-library-functions.sh

if [[ -d "$CACTUS_HOME" ]]; then

    # shellcheck disable=SC2034
    CACTUS_VERSION=$(project_version "$CACTUS_HOME")

fi

if [[ -d "$KIVAKIT_HOME" ]]; then

    KIVAKIT_VERSION=$(project_version "$KIVAKIT_HOME")
    # shellcheck disable=SC2034
    KIVAKIT_ASSETS_HOME=$PWD/kivakit-assets
    # shellcheck disable=SC2034
    KIVAKIT_STUFF_HOME=$PWD/kivakit-stuff
    # shellcheck disable=SC2034
    KIVAKIT_EXTENSIONS_HOME=$PWD/kivakit-extensions
    # shellcheck disable=SC2034
    KIVAKIT_EXAMPLES_HOME=$PWD/kivakit-examples
    # shellcheck disable=SC2034
    KIVAKIT_CACHE_HOME=~/.kivakit/$KIVAKIT_VERSION
    # shellcheck disable=SC2034
    KIVAKIT_JAVA_OPTIONS=-Xmx12g
    # shellcheck disable=SC2034
    KIVAKIT_AGENT_JAR=$KIVAKIT_TOOLS/agent/kivakit-agent.jar

fi

if [[ -d "$MESAKIT_HOME" ]]; then

    # shellcheck disable=SC2155
    MESAKIT_VERSION=$(project_version "$MESAKIT_HOME")
    # shellcheck disable=SC2034
    MESAKIT_ASSETS_HOME=$PWD/mesakit-assets
    # shellcheck disable=SC2034
    MESAKIT_EXTENSIONS_HOME=$PWD/mesakit-extensions
    # shellcheck disable=SC2034
    MESAKIT_EXAMPLES_HOME=$PWD/mesakit-examples
    # shellcheck disable=SC2034
    MESAKIT_CACHE_HOME=~/.kivakit/$MESAKIT_VERSION
    # shellcheck disable=SC2034
    MESAKIT_JAVA_OPTIONS=-Xmx12g

fi

show_workspace
