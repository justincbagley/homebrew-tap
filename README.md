# homebrew-tap
Justin Bagley's custom Homebrew formulae

This is a [Homebrew](https://brew.sh) tap containing [Ruby](https://www.ruby-lang.org/en/) formulae for installing the following packages:

-   [bgc_tools](https://github.com/justincbagley/bgc-tools)
-   [PIrANHA](https://github.com/justincbagley/piranha)
-   [Teams_Attendance](https://github.com/justincbagley/Teams-Attendance)

## Add this tap

-   `brew tap justincbagley/homebrew-tap`

OR: 

-   `brew tap justincbagley/tap`
<!--For PIrANHA, also see [here](https://github.com/justincbagley/homebrew-piranha).-->

## Install

Two sets of Homebrew install options:

1.  Regular install to latest published release/version:

-   bgc_tools:  `brew install bgc_tools`
-   PIrANHA:  `brew install piranha`
-   Teams_Attendance:  `brew install teams_attendance`

2.  Install latest cutting-edge development version:

-   bgc_tools:  `brew install --HEAD bgc_tools`
-   PIrANHA:  `brew install --HEAD piranha`
-   Teams_Attendance:  `brew install --HEAD teams_attendance`

Ensuring PIrANHA install success:

To ensure PIrANHA install success, or if `piranha` executable is not available with tab completion (shown [here](https://github.com/justincbagley/piranha#piranha)) at the command line interface (cli), then do:

```bash
source /usr/local/Cellar/piranha/*/bin/source_piranha_compl.sh ;
source ~/.bash_profile ;
```

## Update

Regular upgrade to latest published release/version:

-   bgc_tools:  `brew upgrade bgc_tools`
-   PIrANHA:  `brew upgrade piranha`
-   Teams_Attendance:  `brew upgrade teams_attendance`

*Recommended:*

Upgrade to latest cutting-edge development version:

-   bgc_tools:  `brew upgrade --fetch-HEAD bgc_tools`
-   PIrANHA:  `brew upgrade --fetch-HEAD piranha`
-   Teams_Attendance:  `brew upgrade --fetch-HEAD teams_attendance`

## Uninstall

First: 

-   bgc_tools:  `brew uninstall bgc_tools`
-   PIrANHA:  `brew uninstall piranha`
-   Teams_Attendance:  `brew uninstall teams_attendance`

Then:

-   `brew untap justincbagley/homebrew-tap`

OR:

-   `brew untap justincbagley/tap`

*Last update:* December 14, 2020
