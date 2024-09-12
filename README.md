# bicep-github-actions-playground
Playing with bicep and github actions

## Prerequisites

1. Create a service principal to allow GitHub Actions to create resources in Azure (provide your subscription ID):

```bash
az ad sp create-for-rbac --name GitHubActions-bicep --role contributor --scopes /subscriptions/<your subscription ID> --json-auth
```

2. Store the output of this command as a secret named `AZURE_CREDENTIALS`;
3. Profit.
