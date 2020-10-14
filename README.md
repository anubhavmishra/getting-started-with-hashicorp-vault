# Getting Started with HashiCorp Vault
Getting Started with HashiCorp Vault book code examples and configuration.

## Usage

### Running local Vault server in dev mode

```bash
make run_dev
```

Expected output

```bash
vault server -dev -dev-root-token-id=root -dev-listen-address=0.0.0.0:8200
==> Vault server configuration:

             Api Address: http://0.0.0.0:8200
                     Cgo: disabled
         Cluster Address: https://0.0.0.0:8201
              Go Version: go1.14.7
              Listener 1: tcp (addr: "0.0.0.0:8200", cluster address: "0.0.0.0:8201", max_request_duration: "1m30s", max_request_size: "33554432", tls: "disabled")
               Log Level: info
                   Mlock: supported: false, enabled: false
           Recovery Mode: false
                 Storage: inmem
                 Version: Vault v1.5.4
             Version Sha: 1a730771ec70149293efe91e1d283b10d255c6d1

WARNING! dev mode is enabled! In this mode, Vault runs entirely in-memory
and starts unsealed with a single unseal key. The root token is already
authenticated to the CLI, so you can immediately begin using Vault.

You may need to set the following environment variable:

    $ export VAULT_ADDR='http://0.0.0.0:8200'

The unseal key and root token are displayed below in case you want to
seal/unseal the Vault or re-authenticate.

Unseal Key: XXXXXXXXXXXXXXXXXXXXXXXXXXX
Root Token: root

Development mode should NOT be used in production installations
```

> Note: This will start Vault in development mode. This is not to be used in production.

Set Vault address

```bash
export VAULT_ADDR='http://0.0.0.0:8200'
```

Validate

```bash
vault status
```

Expected output

```bash
Key             Value
---             -----
Seal Type       shamir
Initialized     true
Sealed          false
Total Shares    1
Threshold       1
Version         1.5.4
Cluster Name    vault-cluster-83f4fa4d
Cluster ID      e5453ced-3749-74ec-3aba-60b69dfe88cf
HA Enabled      false
```
