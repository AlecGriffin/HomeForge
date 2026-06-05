# Helpful Vault Commands

## List Commands

### List secrets (using mount)

```bash
vault kv list -address=https://vault.thegriffinshome.com -mount=homelab
```


### List secrets (using path)

```bash
vault kv list -address=https://vault.thegriffinshome.com homelab
```


## Get Data Commands

### List secrets (using mount)

```bash
vault kv get -address=https://vault.thegriffinshome.com -mount=homelab hello
```

### List secrets (using path)
```bash
vault kv get -address=https://vault.thegriffinshome.com homelab/hello
```

## Get Metadata Commands

```bash
vault kv metadata get -address=https://vault.thegriffinshome.com homelab/hello
```
