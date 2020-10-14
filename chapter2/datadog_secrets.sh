
#!/bin/bash
# fetch the secrets from Vault
export USER_NAME=$(curl -s --header "X-Vault-Token: $(cat ~/.vault-token)" http://localhost:8200/v1/secret/data/logins/datadog | jq -r .data.data.username)
export PASSWORD=$(curl -s --header "X-Vault-Token: $(cat ~/.vault-token)" http://localhost:8200/v1/secret/data/logins/datadog | jq -r .data.data.password)
