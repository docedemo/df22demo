# Demo App based on E-Bikes Lightning Web Components Sample Application

[![CI Workflow](https://github.com/trailheadapps/ebikes-lwc/workflows/CI/badge.svg)](https://github.com/trailheadapps/ebikes-lwc/actions?query=workflow%3ACI) [![codecov](https://codecov.io/gh/trailheadapps/ebikes-lwc/branch/main/graph/badge.svg)](https://codecov.io/gh/trailheadapps/ebikes-lwc)

![ebikes-logo](ebikes-logo.png)

E-Bikes is a sample application that demonstrates how to build applications with Lightning Web Components and integrate with Salesforce Experiences. E-Bikes is a fictitious electric bicycle manufacturer. The application helps E-Bikes manage their products and reseller orders using a rich user experience.

<div>
    <img src="https://res.cloudinary.com/hy4kyit2a/f_auto,fl_lossy,q_70,w_50/learn/projects/quick-start-ebikes-sample-app/a11bf85d136053cdb4745123c4d0ae61_badge.png" align="left" alt="Trailhead Badge"/>
    Learn more about this app by completing the <a href="https://trailhead.salesforce.com/en/content/learn/projects/quick-start-ebikes-sample-app">Quick Start: Explore the E-Bikes Sample App</a> Trailhead project.
    <br/>
    <br/>
    <br/>
</div>

> This sample application is designed to run on Salesforce Platform. If you want to experience Lightning Web Components on any platform, please visit https://lwc.dev, and try out our Lightning Web Components sample application [LWC Recipes OSS](https://github.com/trailheadapps/lwc-recipes-oss).

> `Note`: This variant of Ebikes is designed only for Salesforce Platform and does not include the Experience Cloud.

## Table of contents

-   [Installing this demo app using a scratch org](#installing-e-bikes-using-a-scratch-org)

-   [Installing this demo app using a Developer Edition Org or a Trailhead Playground](#installing-e-bikes-using-a-developer-edition-org-or-a-trailhead-playground)

-   [Optional installation instructions](#optional-installation-instructions)

-   [Code tours](#code-tours)

## Installing Demo App using a Scratch Org

1. Set up your environment. Follow the steps in the [Quick Start: Lightning Web Components](https://trailhead.salesforce.com/content/learn/projects/quick-start-lightning-web-components/) Trailhead project. The steps include:

    - Enable Dev Hub in your Trailhead Playground
    - Install Salesforce CLI
    - Install Visual Studio Code
    - Install the Visual Studio Code Salesforce extensions, including the Lightning Web Components extension

1. If you haven't already done so, authorize your hub org and provide it with an alias (**myhuborg** in the command below):

    ```
    sfdx auth:web:login -d -a myhuborg
    ```

1. Clone the repository:

    ```
    git clone https://github.com/satyasekharcvb/tdx22demo.git
    cd tdx22demo
    ```

1. Create a scratch org and provide it with an alias (**ebikes** in the command below):

    ```
    sfdx force:org:create -s -f config/project-scratch-def.json -a ebikes
    ```

1. Push the app to your scratch org:

    ```
    sfdx force:source:push
    ```

1. Assign the **ebikes** permission set to the default user:

    ```
    sfdx force:user:permset:assign -n ebikes
    ```

1. Assign the **Walkthroughs** permission set to the default user:

    ```
    sfdx force:user:permset:assign -n Walkthroughs
    ```

1. Import sample data:

    ```
    sfdx force:data:tree:import -p ./data/sample-data-plan.json
    ```

1. Open the scratch org:

    ```
    sfdx force:org:open
    ```

1. In **Setup**, under **Themes and Branding**, activate the **Lightning Lite** theme.

1. In App Launcher, select the **E-Bikes** app.

## Installing the Demo App using a Developer Edition Org or a Trailhead Playground

Follow this set of instructions if you want to deploy the app to a more permanent environment than a Scratch org.
This includes non source-tracked orgs such as a [free Developer Edition Org](https://developer.salesforce.com/signup) or a [Trailhead Playground](https://trailhead.salesforce.com/).

Make sure to start from a brand-new environment to avoid conflicts with previous work you may have done.

1. Clone this repository:

    ```
    git clone https://github.com/satyasekharcvb/tdx22demo.git
    cd tdx22demo
    ```

1. Authorize your Trailhead Playground or Developer org and provide it with an alias (**mydevorg** in the command below):

    ```
    sfdx auth:web:login -s -a mydevorg
    ```

1. Run this command in a terminal to deploy the app.

    ```
    sfdx force:source:deploy -p force-app
    ```

1. Assign the **ebikes** permission set to the default user.

    ```
    sfdx force:user:permset:assign -n ebikes
    ```

1. Import some sample data.

    ```
    sfdx force:data:tree:import -p ./data/sample-data-plan.json
    ```

1. If your org isn't already open, open it now:

    ```
    sfdx force:org:open
    ```

1. In **Setup**, under **Themes and Branding**, activate the **Lightning Lite** theme.

1. In App Launcher, select the **E-Bikes** app.
## Installing the Demo App using Code Builder with a connected Org

Make sure to start from a brand-new environment to avoid conflicts with previous work you may have done. Open the terminal within Code Builder to execute these commands 

1. Run this command in a terminal to deploy the app.

    ```
    sfdx force:source:deploy -p force-app
    ```

1. Assign the **ebikes** permission set to the default user.

    ```
    sfdx force:user:permset:assign -n ebikes
    ```

1. Import some sample data.

    ```
    sfdx force:data:tree:import -p ./data/sample-data-plan.json
    ```

1. If your org isn't already open, open it now:

    ```
    sfdx force:org:open
    ```
    <b>Note:</b> Code Builder is a headless environment, so you can run `sfdx force:org:open` and then following the instructions from the terminal window.  Or you can go to the salesforce login page.
1. In **Setup**, under **Themes and Branding**, activate the **Lightning Lite** theme.

1. In App Launcher, select the **E-Bikes** app.

## Optional Installation Instructions (does not apply to Code Builder)

This repository contains several files that are relevant if you want to integrate modern web development tooling to your Salesforce development processes, or to your continuous integration/continuous deployment processes.

### Code formatting

[Prettier](https://prettier.io/) is a code formatter used to ensure consistent formatting across your code base. To use Prettier with Visual Studio Code, install [this extension](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) from the Visual Studio Code Marketplace. The [.prettierignore](/.prettierignore) and [.prettierrc](/.prettierrc) files are provided as part of this repository to control the behavior of the Prettier formatter.

### Code linting

[ESLint](https://eslint.org/) is a popular JavaScript linting tool used to identify stylistic errors and erroneous constructs. To use ESLint with Visual Studio Code, install [this extension](https://marketplace.visualstudio.com/items?itemName=salesforce.salesforcedx-vscode-lwc) from the Visual Studio Code Marketplace. The [.eslintignore](/.eslintignore) file is provided as part of this repository to exclude specific files from the linting process in the context of Lightning Web Components development.

### Pre-commit hook

This repository also comes with a [package.json](./package.json) file that makes it easy to set up a pre-commit hook that enforces code formatting and linting by running Prettier and ESLint every time you `git commit` changes.

To set up the formatting and linting pre-commit hook:

1. Install [Node.js](https://nodejs.org) if you haven't already done so

1. Run `npm install` in your project's root folder to install the ESLint and Prettier modules (Note: Mac users should verify that Xcode command line tools are installed before running this command.)

Prettier and ESLint will now run automatically every time you commit changes. The commit will fail if linting errors are detected. You can also run the formatting and linting from the command line using the following commands (check out [package.json](./package.json) for the full list):

```
npm run lint
npm run prettier
```

## Code Tours

Code Tours are guided walkthroughs that will help you understand the app code better. To be able to run them, install the [CodeTour VSCode extension](https://marketplace.visualstudio.com/items?itemName=vsls-contrib.codetour).
