#! /bin/bash

## APP ROLE ##

# enable and configure app role
vault auth enable approle

vault write auth/approle/role/payments_service \
    secret_id_ttl=10m \
    secret_id_num_uses=10 \
    token_ttl=1h \
    token_max_ttl=3600h \
    policies=payments_service

# create an example payments service policy
vault policy write payments_service payments_service.hcl
