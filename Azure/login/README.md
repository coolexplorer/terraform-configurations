# Logging into the Azure CLI

```shell
$ az login
```

Then, Azure login webpage is opened automatically and need to add ID and password.
Once logged in, you can get account list using `az list` command.

```shell
$ az account list
```

```json
[
  {
    "cloudName": "AzureCloud",
    "id": "00000000-0000-0000-0000-000000000000",
    "isDefault": true,
    "name": "PAYG Subscription",
    "state": "Enabled",
    "tenantId": "00000000-0000-0000-0000-000000000000",
    "user": {
      "name": "user@example.com",
      "type": "user"
    }
  }
]
```

If you have one more subscriptions, set the subscription you want to use when run the az command.

```shell
$ az account set --subscription="SUBSCRIPTION_ID"
```
