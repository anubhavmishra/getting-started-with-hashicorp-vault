# Allows validating token being used has correct permissions 
path "auth/token/lookup-self" {
  capabilities = ["read"]
}

# Allows revoking invalid tokens 
path "auth/token/revoke-accessor" {
  capabilities = ["update"]
}

path "auth/token/lookup" {
  capabilities = ["update"]
}

# Validate token's own capabilities on Nomad server startup
path "sys/capabilities-self" {
  capabilities = ["update"]
}

# Allows for Nomad's own token renewal
path "auth/token/renew-self" {
  capabilities = ["update"]
}

# Allows creating and updating tokens for hellocorp-nomad-workloads Vault role
path "auth/token/create/hellocorp-nomad-workloads" {
  capabilities = ["create", "update"]
}

path "auth/token/roles/hellocorp-nomad-workloads" {
  capabilities = ["read"]
}
