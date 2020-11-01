#! /bin/sh

# start the agent using the defined config
vault agent --config auth_config.hcl

# Secrets can now be read by proxying through the vault agent
# $ VAULT_ADDR=http://localhost:8300 vault kv get secret/data/team_payments/api

