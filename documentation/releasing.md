<!--suppress HtmlUnknownTarget, HtmlRequiredAltAttribute -->

# Releasing Telenav Open Source Projects

## Step-by-Step Instructions &nbsp; <img src="https://telenav.github.io/telenav-assets/images/icons/footprints-32.png" srcset="https://telenav.github.io/telenav-assets/images/icons/footprints-32-2x.png 2x"/>

This section describes, step-by-step, how to release a new version of any Telenav Open Source project.

In the text below `project-version` refers to a [semantic versioning](https://semver.org) identifier, such as `2.1.7`, `4.0.1-SNAPSHOT` or `1.4.0-beta`.

Although Telenav Open Source projects do not use git flow, they adhere to the [Git Flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) branching model.

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512-2x.png 2x"/>

## 1. Prerequisites  &nbsp; <img src="https://telenav.github.io/telenav-assets/images/icons/box-32.png" srcset="https://telenav.github.io/telenav-assets/images/icons/box-32-2x.png 2x"/>


1. Complete all steps of [developer setup](developing.md)
2. Releasing software to Maven Central requires PGP keys to be installed. Contact the project's administrator(s) for access to them.

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512-2x.png 2x"/>

## 2. Releasing &nbsp; <img src="https://telenav.github.io/telenav-assets/images/icons/branch-32.png" srcset="https://telenav.github.io/telenav-assets/images/icons/branch-32-2x.png 2x"/>

To create a release, we must follow the steps below. A summary of the steps required to release  
KivaKit and MesaKit:

1. `telenav-branch-develop`
2. **[update change-log.md]**
3. **[update kivakit.version]**
4. `telenav-commit && telenav-push`
5. `telenav-clean-sparkling && kivakit-release && mesakit-release`
6. **[check release]**
7. **[commit and push assets repositories]**
8. **[publish release to maven central]**
9. `kivakit-bump-version && mesakit-bump-version`
10. `kivakit-merge-to-releases && mesakit-merge-to-releases`
 
<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

### 2.1 Creating the Release 

To create a release:

1. Ensure that all projects are on the `develop` branch with `telenav-branch-develop`
2. Update the `change-log.md` for the project group
3. Commit any outstanding changes and push them
4. Clean out any cache folders, and the maven repository with `telenav-clean-sparkling` 
5. Build the release with the script for your project group, like `kivakit-release`

It is normally necessary to update mesakit when kivakit is updated to make sure that only one version
of KivaKit is used at a time.

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

### 2.2 Checking the Release 

The release process will have created Javadoc and Lexakai documentation in the project assets repository.
Inspect this documentation and any changes made to `README.md` files. If the documentation looks okay,
commit and push the changes.

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

### 2.3 Publishing the Release

The release should now be ready for Maven Central. We must sign into Sonatype [OSSRH](https://s01.oss.sonatype.org) (using credentials provided by a project administrator), and push the release:

1. Locate the staged build (created above) by clicking the *Staging Repositories* link
2. Check the activities tab for the selected repository. If all went well, the *Release* 
   button will be available and can be pushed to publish the build to *Maven Central*. 
   If the release button remains disabled, the specific requirement that failed will be
   displayed in the list of verification activities, so it can be addressed before trying again.

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

### 2.4 Updating Project Versions

The project versions on the develop branch should be updated with the appropriate script for the
project group, for example, `kivakit-bump-version`. These changes should be examined, committed,
and pushed.

<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-128-2x.png 2x"/>

### 2.5 Merging to the Releases Branch

The released code should be merged to the `releases` branch and marked with a tag using the appropriate script,
such as `kivakit-merge-to-releases`. These changes should be examined, committed, and pushed.

<br/>
<img src="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512.png" srcset="https://telenav.github.io/telenav-assets/images/separators/horizontal-line-512-2x.png 2x"/>

<sub>Copyright &#169; 2011-2021 [Telenav](https://telenav.com), Inc. Distributed under [Apache License, Version 2.0](../LICENSE)</sub>  
<sub>This documentation was generated by [Lexakai](https://www.lexakai.org). UML diagrams courtesy of [PlantUML](https://plantuml.com).</sub>
