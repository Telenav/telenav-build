<!--suppress HtmlUnknownTarget, HtmlRequiredAltAttribute -->

# Developing &nbsp; &nbsp;  <img src="https://telenav.github.io/telenav-assets/images/icons/bluebook-32.png" srcset="https://telenav.github.io/telenav-assets/images/icons/bluebook-32-2x.png 2x"/>

If you are helping to develop Telenav Open Source projects this page will help you get going. 

### Index

 - [**Setup**](#setup)
 - [**Our Development Practices**](#development-practices)
 - [**Convenient Scripts for Developers**](#scripts-for-developers)
 - [**Workflow for Developing a Feature**](#workflow-for-developing-a-feature)
 - [**Workspace Information**](#workspace-information)
 - [**Building**](#building)
 - [**Releasing**](#releasing)
 - [**Versioning**](#versioning)
 - [**Source Control**](#source-control)
 - [**Git Flow**](#git-flow)
 - [**Git Operations**](#git-operations)
 - [**Adding a Submodule**](#adding-a-submodule)

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512-2x.png 2x"/>

<a name = "setup"></a> 
## Setup &nbsp; <img src="https://telenav.github.io/telenav-assets/images/icons/box-24.png" srcset="https://telenav.github.io/telenav-assets/images/icons/box-24-2x.png 2x"/>

1. Follow the [Initial Setup Instructions](initial-setup-instructions.md).

2. Download and install [IntelliJ](https://www.jetbrains.com/idea/download/) or [Netbeans](https://netbeans.apache.org/download/index.html)

3. In IntelliJ, use `File` / `Manage IDE Settings` / `Import Settings` to import `setup/intellij/telenav-all-settings.zip`

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

<a name = "development-practices"></a>
## Our Development Practices

Once you're ready to go, these articles can help you to understand our development practices:

- [Telenav Open Source Process](telenav-open-source-process.md)  
- [Versioning](versioning.md)  
- [Releasing](releasing.md)  
- [Naming Conventions](naming-conventions.md)  
- [Java 17+ Migration Notes](java-migration-notes.md)

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

<a name = "scripts-for-developers"></a>
## Convenient Scripts for Developers  &nbsp; <img src="https://telenav.github.io/telenav-assets/images/icons/toolbox-32.png" srcset="https://telenav.github.io/telenav-assets/images/icons/toolbox-32-2x.png 2x"/>

The `telenav-build/bin` folder contains a set of bash scripts, all prefixed with `telenav-`.
After following the [Initial Setup Instructions](documentation/initial-setup-instructions.md), 
the `bin` folder will be on your PATH. The scripts described here translate their arguments
into arguments for Git and Maven. Since all scripts have an equivalent Git or Maven syntax, 
they are *not required*, merely convenient.

> **HINT**: To see what scripts are available, type `telenav-` in a bash shell and hit `TAB`. 

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

<a name = "feature-development"></a>
## Workflow for Developing a Feature &nbsp; <img src="https://telenav.github.io/telenav-assets/images/icons/branch-32.png" srcset="https://telenav.github.io/telenav-assets/images/icons/branch-32-2x.png 2x"/>


1. `telenav-branch-develop` switches all projects to the `develop` branch
2. `telenav-branch-start-feature hover-mode-#87` creates and switches all projects in the workspace to the `feature/hover-mode#87` branch
3. **[coding]**
4. `telenav-push` pushes all relevant branches to Github
5. `telenav-pull-request` creates a pull request for the branch
6. **[code review]**
7. `telenav-pull-request-merge` merges all pull requests at once into the `develop` branch and delete the feature branch
8. `telenav-branch-develop` switches all projects back to the `develop` branch

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

<a name = "workspace-information"></a>
## Workspace Information

To get the versions of tools, and repository families in the Telenav workspace, run `telenav-version`:

    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Versions ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    ┋
    ┋  Repositories:
    ┋
    ┋          KivaKit: 1.6.0
    ┋          MesaKit: 0.9.14
    ┋
    ┋  Tools:
    ┋
    ┋             Java: 17.0.3
    ┋            Maven: 3.8.5
    ┋              Git: 2.36.1
    ┋
    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

To get information about the projects in the Telenav workspace, run `telenav-workspace`:

    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Telenav Workspace ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    ┋
    ┋        TELENAV_WORKSPACE: /Users/jonathan/Workspaces/kivakit-1.6/feature
    ┋
    ┋             KIVAKIT_HOME: /Users/jonathan/Workspaces/kivakit-1.6/feature/kivakit
    ┋          KIVAKIT_VERSION: 1.6.0
    ┋       KIVAKIT_CACHE_HOME: /Users/jonathan/.kivakit/1.6.0
    ┋      KIVAKIT_ASSETS_HOME: /Users/jonathan/Workspaces/kivakit-1.6/feature/kivakit-assets
    ┋     KIVAKIT_JAVA_OPTIONS: -Xmx12g
    ┋
    ┋             MESAKIT_HOME: /Users/jonathan/Workspaces/kivakit-1.6/feature/mesakit
    ┋          MESAKIT_VERSION: 0.9.14
    ┋       MESAKIT_CACHE_HOME: /Users/jonathan/.kivakit/0.9.14
    ┋      MESAKIT_ASSETS_HOME: /Users/jonathan/Workspaces/kivakit-1.6/feature/mesakit-assets
    ┋     MESAKIT_JAVA_OPTIONS: -Xmx12g
    ┋
    ┋                JAVA_HOME: /Users/jonathan/Developer/amazon-corretto-17.jdk/Contents/Home
    ┋
    ┋                  M2_HOME: /Users/jonathan/Developer/apache-maven-3.8.5
    ┋
    ┋                     PATH: /Users/jonathan/Developer/amazon-corretto-17.jdk/Contents/Home/bin
    ┋                           /Users/jonathan/Developer/apache-maven-3.8.5/bin
    ┋                           /usr/local/bin
    ┋                           /usr/bin
    ┋                           /bin
    ┋                           /usr/sbin
    ┋                           /sbin
    ┋                           /Library/TeX/texbin
    ┋                           /Users/jonathan/Workspaces/kivakit-1.6/feature/bin
    ┋
    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

<br/>
<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

<a name = "building"></a>
## Building &nbsp; <img src="https://telenav.github.io/telenav-assets/images/icons/command-line-24.png" srcset="https://telenav.github.io/telenav-assets/images/icons/command-line-24-2x.png 2x"/> 

The following script make building and releasing Telenav workspace projects easy:

| Script                      | Purpose                                                                                       |
|-----------------------------|-----------------------------------------------------------------------------------------------|
| `telenav-clean`             | Prepares for a build by removing cache folders, and Telenav artifacts in the maven repository |
| `telenav-clean-sparkling`   | Prepares for a build by removing cache folders, and the entire maven repository               |
| `kivakit-build`             | Build all KivaKit projects                                                                    |
| `lexakai-build`             | Build Lexakai                                                                                 |
| `mesakit-build`             | Build all MesaKit projects                                                                    |
| `telenav-workspace-build`   | Builds all projects in the workspace                                                          |
| `telenav-third-party-build` | Builds third party JARs project                                                               |

<br/>
<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

<a name = "releasing"></a>
## Releasing  &nbsp;  <img src="https://telenav.github.io/telenav-assets/images/icons/rocket-32.png" srcset="https://telenav.github.io/telenav-assets/images/icons/rocket-32-2x.png 2x"/>

Each project in the Telenav workspace has a simple script in the root called `release`. This
script can be used to release the project. However, it is not typical to release one project
at a time. Projects are released in groups, for example, the `kivakit` group includes the `kivakit`,
`kivakit-extensions`, and `kivakit-stuff` repositories. The following scripts can be used to
release all projects in a group. For information, see the [release process documentation](releasing.md).

| Script                        | Purpose                                                                           |
|-------------------------------|-----------------------------------------------------------------------------------|
| `telenav-clean-sparkling`     | Prepares for a release by removing cache folders, and the entire maven repository |
| `kivakit-release`             | Release all KivaKit projects                                                      |
| `lexakai-release`             | Release Lexakai                                                                   |
| `mesakit-release`             | Release all MesaKit projects                                                      |
| `telenav-third-party-release` | Release the telenav-third-party JARs project                                      |

<br/>
<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

<a name = "versioning"></a>
## Versioning 

The versions for all projects in a group can be updated with the following scripts. Each script bumps the
project's version to the next dot release. The convention for versioning is that the `develop`
branch for each repository contains the version for the next release. After that release is published, 
one or more of the scripts below should be used to advance the `develop` branch to the next version
number. **Note that there are no snapshot builds.**

| Script                             | Purpose                                                  |
|------------------------------------|----------------------------------------------------------|
| `kivakit-bump-version`             | Bump the version of all KivaKit projects                 |
| `lexakai-bump-version`             | Bump the version of Lexakai                              |
| `mesakit-bump-version`             | Bump the version of all MesaKit projects                 |
| `telenav-third-party-bump-version` | Bump the version of the telenav-third-party JARs project |

<br/>
<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

<a name = "source-control"></a>
## Source Control <img src="https://telenav.github.io/telenav-assets/images/icons/branch-32.png" srcset="https://telenav.github.io/telenav-assets/images/icons/branch-32-2x.png 2x"/>

Telenav Open Source projects are published on [Github](https://www.github.com/) and use Git for source control. 

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

<a name = "git-flow"></a>
### The Git Flow Branching Model

Although Telenav Open Source projects do not use git flow, they adhere to the [Git Flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) branching model.
This model specifies the following branch naming convention:

| Git Branch        | Purpose               |
|-------------------|-----------------------|
| `release/current` | Latest stable release |
| `develop`         | Development build     |
| `bugfix/*`        | Bug fix branches      |
| `feature/*`       | Feature branches      |
| `hotfix/*`        | Hot fix branches      |

<br/>
<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

<a name = "git-operations"></a>
### Git Operations

After following the [Initial Setup Instructions](initial-setup-instructions.md), the scripts below will be available.
These scripts work on all projects in the workspace, which is the primary use case for developers. For more 
granular work using scopes, see [Cactus](https://github.com/Telenav/cactus).


| Script                                             | Purpose                                                                          |
|----------------------------------------------------|----------------------------------------------------------------------------------|
| `telenav-branch` `branch-name`                     | Checks out the given branch of all repositories in the workspace                 |
| `telenav-branch-develop`                           | Checks out the develop branch all repositories in the workspace                  |
| `telenav-branch-start-[branch-type]` `branch-name` | Starts a branch of the given git-flow type for all repositories in the workspace |
| `telenav-cactus-log`                               | Shows the cactus tool's log when a command fails                                 |
| `telenav-commit` `message`                         | Commits all workspace changes with the given message                             |
| `telenav-is-dirty`                                 | Shows which repositories in the workspace are dirty                              |
| `telenav-pull`                                     | Pulls from all repositories in the workspace                                     |
| `telenav-pull-request-approve` `branch` `body`     | Approves all pull requests for the given branch using the given body of text     |                                                    
| `telenav-pull-request-create` `title` `body`       | Creates a pull request for all repositories in the workspace                     |
| `telenav-pull-request-merge` `branch`              | Merges all pull requests of the given branch into the current branch             |
| `telenav-pull-request-show-all` `branch`           | Shows all pull requests in a browser                                             |
| `telenav-push`                                     | Pushes all changes in the workspace                                              |
| `telenav-reset`                                    | Resets the workspace, losing all changes                                         |
| `telenav-status`                                   | Shows the status of all repositories in the workspace                            |
| `telenav-workspace-reset`                          | Hard resets the entire workspace                                                 |

Here, `branch-type` must be one of:

 - `bugfix`
 - `feature`
 - `hotfix`

<br/>
<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

<a name = "adding-a-submodule"></a>
### Adding a Submodule

To add a submodule to a workspace:

```
git submodule add -b [branch-name] [repository-name]  
git submodule init  
git submodule update
```
<br/>
<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512-2x.png 2x"/>

<sub>Copyright &#169; 2011-2021 [Telenav](https://telenav.com), Inc. Distributed under [Apache License, Version 2.0](../LICENSE)</sub>  
<sub>This documentation was generated by [Lexakai](https://www.lexakai.org). UML diagrams courtesy of [PlantUML](https://plantuml.com).</sub>
