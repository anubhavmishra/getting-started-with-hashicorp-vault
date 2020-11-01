#!/bin/sh

## LDAP ##

# enabled ldap auth and configure for glauth
vault auth enable ldap
vault write auth/ldap/config \
    url="ldap://localhost:3893" \
    userdn="ou=users,dc=glauth,dc=com" \
    groupdn="ou=groups,dc=glauth,dc=com" \
    insecure_tls=true \
    groupfilter="(cn={{.Username}})" \
    groupattr="memberOf" \
    starttls=false

# create an example admin policy
vault policy write admin admin.hcl

vault write auth/ldap/groups/admin policies=admin

# create an example team_payments policy
vault policy write team_payments team_payments.hcl

vault write auth/ldap/groups/team_payments policies=team_payments

# add an example secret
vault kv put secret/data/team_payments/api foo=bar

# create an example developers policy
vault policy write developers developers.hcl

vault write auth/ldap/groups/developers policies=developers


