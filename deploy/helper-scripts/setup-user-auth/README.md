# Auth Setup

[kubelogin](https://github.com/int128/kubelogin)

## Token Claims Example


```json
{
  "iss": "https://gitlab.thegriffinshome.com",
  "sub": "1",
  "aud": "7559b45c6c13286513b01df340c1e61479de9f0a84aa9e98e311bca865cf6d27",
  "exp": 1767329965,
  "iat": 1767329845,
  "nonce": "5Qv5go6L-Iq-OcBJRdHvde0Dwi9kCi8CZ465g0gHV34",
  "auth_time": 1767062523,
  "sub_legacy": "906d7c202b1d72faa2e269705d4aef7ef6895911c745a2783b94032b6d9bc3df",
  "name": "Alec Griffin",
  "nickname": "alecgriffin",
  "preferred_username": "alecgriffin",
  "profile": "https://gitlab.thegriffinshome.com/alecgriffin",
  "picture": "https://secure.gravatar.com/avatar/5c950f92e8cb1901dcd047db2477a773937316810170a00bd89812c7b056f46d?s=80&d=identicon",
  "groups_direct": [
    "homelab/admin",
    "homelab",
    "homelab/hosted-websites",
    "homelab/test-pipelines/k8s-auth-test-deletion_scheduled-39",
    "homelab/test-pipelines",
    "homelab/tools"
  ]
}
```

## Set up the kubeconfig

You can run the following command to set up the kubeconfig:

```bash
kubectl config set-credentials oidc \
  --exec-api-version=client.authentication.k8s.io/v1 \
  --exec-interactive-mode=Never \
  --exec-command=kubectl \
  --exec-arg=oidc-login \
  --exec-arg=get-token \
  --exec-arg="--oidc-issuer-url=https://gitlab.thegriffinshome.com" \
  --exec-arg="--oidc-client-id=7559b45c6c13286513b01df340c1e61479de9f0a84aa9e98e311bca865cf6d27"
```