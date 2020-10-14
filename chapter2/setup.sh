#! /bin/bash

# Add a secret using the CLI
vault kv put secret/logins/datadog username=myuser@example.com password=password

vault kv get secret/logins/datadog

vault kv list secret

vault kv list secret/logins

vault policy write restrict_datadog restrict_datadog.hcl

curl -s --header "X-Vault-Token: $(cat ~/.vault-token)" http://localhost:8200/v1/secret/data/logins/datadog

export USER_NAME=$(curl -s --header "X-Vault-Token: $(cat ~/.vault-token)" http://localhost\ :8200/v1/secret/data/logins/datadog | jq -r .data.data.username)
export PASSWORD=$(curl -s --header "X-Vault-Token: $(cat ~/.vault-token)" http://localhost:\ 8200/v1/secret/data/logins/datadog | jq -r .data.data.password)

echo "Username: $USER_NAME"
echo "Password: $PASSWORD"
