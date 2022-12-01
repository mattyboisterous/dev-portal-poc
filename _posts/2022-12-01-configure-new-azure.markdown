---
layout: post
title:  "Creating and configuring an R4Q Azure Environment"
date:   2022-12-01 07:55:18 +1000
category: [cloud, azure]
author: mattyboisterous 
---
A prerequisite for creating and configuring an Azure environment is that an Azure resource group has been created for the environment, and a service principal has been created, allowing access to the resource group.

The next important step is to [create an Azure Service connection](https://dev.azure.com/qed-qld-gov-au/Mobile%20Apps/_wiki/wikis/Mobile-Apps.wiki/675/DevOps-Azure-Service-Connections) for the environment. This will allow the Azure Devops pipelines access to artefacts within the resource group.

## Create the Azure KeyVault

Before deploying the ARM templates for the first time, ensure all sensitive configuration data is identified and added to Azure KeyVault. This is an encrypted store which can be referenced from the App service app settings as well as through Azure Devops pipelines.

As well as creating the KeyVault, it will need to have access policies configured so values can be read: 
- from the Azure Devops pipelines, and;
- from the App Service itself.

Prep: Find out the "Service Principal Id" of the service connection for this environment. You will need this when adding an Access Policy for the Service Principal (used by the Azure Devops Pipelines)

* Create the Keyvault (use a naming convention appropriate for the application, e.g. 'kv-r4q-zone2')
** Ensure Region is Australia Southeast, Pricing tier is Standard.
* Open the KeyVault properties in Azure
* Under "Settings", click on "Access policies"
* Check "Azure Resource Manager for template deployment"
* Under Permission model leave "Vault access policy" as default.

### Add an Access policy for the service principal

* Click "+ Add Access Policy"
* Search for the Service Principal Id and select it.
* Select Key permissions "Get, List"
* Select Secret permissions "Get, List"
* Save your changes

### Add an Access policy for the app service

* Browse to your app service in the Azure Portal.
* From the left menu, click "Identity"
* Under system-assigned tab, toggle the Status field on as shown below. This should show a GUID and button below. Then click the Save button to save the newly generated identity.
* Copy the newly created Object Id.
* Browse back to the Key Vault.
* Click "+ Add Access Policy"
* Search for the Object Id and select it.
* Select Key permissions "Get, List"
* Select Secret permissions "Get, List"
* Save changes.

### Add an Access policy for the app service
For any Azure Functions, follow the steps above for configuring an app service (Add an Access policy for the app service).

### Adding secrets to KeyVault

Now all is in readiness for adding the following values to Azure KeyVault.

* On the left hand menu, click on "Secrets"
* On the top menu, click "Generate/Import"
* Enter the name and value of the secret, click "Create"

```
JwtSecret: generated Jwt secret for generating and validating bearer tokens in the R4Q Api authentication middleware.
R4QConnectionStringSecret: Connection string for the R4Q database.
R4QSqlAdminSecret: Password for the R4Q DB user "r4q-admin"
R4QSqlUserSecret: Password for the R4Q DB user "r4q-user"
R4QSqlEipUserSecret: Password for the R4Q DB user "r4q-eip-user"
R4QLogStorageConnectionStringSecret: The connection string for the R4Q Log Storage.
```

At this stage all is in preparation for running the Devops pipelines that deploy the ARM templates, build and release our code and data to an Azure environment.

Generated secrets/passwords using a Node.js command prompt:
Secrets: `node -e "console.log(require('crypto').randomBytes(256).toString('base64'));"`
Passwords: `node -e "console.log(require('crypto').randomBytes(64).toString('base64'));"`

### Azure Key Vault - Allocation of Access 

Navigate to the Key Vault resource and select `Access policies` -> `Add Access Policy`

<a href="{{ site.url }}/assets/img/access-policies.png" data-lity>
  <img src="{{ site.url }}/assets/img/access-policies.png"/>
</a>

To select the user/account, select `Select principal` and then type in the user ID. 

<a href="{{ site.url }}/assets/img/add-access-policy.png" data-lity>
  <img src="{{ site.url }}/assets/img/add-access-policy.png"/>
</a>

Permissions to allocate to the user/account are specified below.

<a href="{{ site.url }}/assets/img/account-permissions.png" data-lity>
  <img src="{{ site.url }}/assets/img/account-permissions.png"/>
</a>















