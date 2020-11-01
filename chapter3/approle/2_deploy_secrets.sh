#! /bin/bash

# fetch the role-id from vault and parse the response
vault read auth/approle/role/payments_service/role-id -format=json | sed -E -n 's/.*"role_id": "([^"]*).*/\1/p' > role_id

# fetch the secret from vault and parse the response
vault write -f auth/approle/role/payments_service/secret-id -format=json | sed -E -n 's/.*"secret_id": "([^"]*).*/\1/p' > secret_id

