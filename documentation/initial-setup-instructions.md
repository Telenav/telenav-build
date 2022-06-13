<!--suppress HtmlUnknownTarget, HtmlRequiredAltAttribute -->

# Initial Setup Instructions   <img src="https://telenav.github.io/telenav-assets/images/icons/box-24.png" srcset="https://telenav.github.io/telenav-assets/images/icons/box-24-2x.png 2x"/>

This article explains how to get set up to build Telenav Open Source projects, including:

 - [kivakit](https://www.kivakit.org/)
 - [mesakit](https://www.mesakit.org/)
 - [lexakai](https://www.lexakai.org/)

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512-2x.png 2x"/>

## 1. Install Required Tools &nbsp; <a name = "install-tools"></a>  <img src="https://telenav.github.io/telenav-assets/images/icons/toolbox-24.png" srcset="https://telenav.github.io/telenav-assets/images/icons/toolbox-24-2x.png 2x"/>

- Bash
- Git 2.30+
- Git Flow 1.12.3+ (AVH Edition)  
   On macOS, install Homebrew,

        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    then use that to install git-flow AVH Edition:

        brew install git-flow-avh

- [Java](https://adoptopenjdk.net/?variant=openjdk17&jvmVariant=hotspot) 17.0.2 or later

- [Maven](https://maven.apache.org/download.cgi) 3.8.5 or later

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

## 2. Checkout and Build   <img src="https://telenav.github.io/telenav-assets/images/icons/box-24.png" srcset="https://telenav.github.io/telenav-assets/images/icons/box-24-2x.png 2x"/>

To check out, configure and build all Telenav Open Source projects for the first time:

    mkdir ~/Workspaces
    cd ~/Workspaces
    git clone https://github.com/Telenav/telenav-build.git
    cd telenav-build
    ./setup.sh [branch-name]?
    
Where `branch-name` is one of:

 - `master` (latest release)
 - `develop` (development code)
 - `feature/*` (feature branch)
 - `hotfix/*` (fix branch)

If `branch-name` is omitted the default branch will be set up.
    
When the checkout and build process completes, you should have a project tree like this:

    └── Workspaces
        └── telenav-build <----------------- $TELENAV_WORKSPACE
            ├── cactus
            ├── cactus-assets
            ├── kivakit <------------------- $KIVAKIT_HOME
            │   ├── kivakit-application
            │   ├── kivakit-collections
            │   ├── kivakit-commandline
            │   └── [...]
            ├── kivakit-assets
            ├── kivakit-examples
            ├── kivakit-extensions
            ├── kivakit-stuff
            ├── mesakit <------------------- $MESAKIT_HOME
            ├── mesakit-assets
            ├── mesakit-examples
            ├── mesakit-extensions
            ├── telenav-assets
            ├── telenav-superpom
            ├── pom.xml
            ├── README.md
            ├── source-me
            └── setup.sh

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

## 3. Set Up a Build Environment   <img src="https://telenav.github.io/telenav-assets/images/icons/command-line-32.png" srcset="https://telenav.github.io/telenav-assets/images/icons/command-line-32-2x.png 2x"/>

To create an environment for future builds, you must set some environment variables in your `~/.profile`.
You can either `cp setup/profile ~/.profile`, or you can modify your existing profile accordingly.
The resulting `.profile` should include steps similar to this:

    export TELENAV_WORKSPACE=$HOME/Workspaces/telenav-build
    
    export JAVA_HOME=/Users/jonathan/Developer/amazon-corretto-17.jdk/Contents/Home
    export M2_HOME=/Users/jonathan/Developer/apache-maven-3.8.5

    mkdir -p $TELENAV_WORKSPACE    
    cd $TELENAV_WORKSPACE
    source source-me
    
> WARNING: Be sure to restart your terminal program entirely after making this change!

> NOTE: On Windows, install [Git for Windows](https://gitforwindows.org/), which will provide both git, and a bash shell.

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>


## 4. Done!   <img src="https://telenav.github.io/telenav-assets/images/icons/rocket-32.png" srcset="https://telenav.github.io/telenav-assets/images/icons/rocket-32-2x.png 2x"/>

Congratulations! You're set up and ready to build Telenav Open Source projects.

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512-2x.png 2x"/>

## Next Steps &nbsp; &nbsp;  <img src="https://telenav.github.io/telenav-assets/images/icons/footprints-32.png" srcset="https://telenav.github.io/telenav-assets/images/icons/footprints-32-2x.png 2x"/>

[I want to build](building.md)

[I want to contribute](developing.md)


<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512-2x.png 2x"/>

<sub>Copyright &#169; 2011-2021 [Telenav](https://telenav.com), Inc. Distributed under [Apache License, Version 2.0](../LICENSE)</sub>  
<sub>This documentation was generated by [Lexakai](https://www.lexakai.org). UML diagrams courtesy of [PlantUML](https://plantuml.com).</sub>