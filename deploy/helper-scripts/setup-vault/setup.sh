#!/bin/bash

# Prerequisite
# - Use vault login command to authenticate with vault

export VAULT_ADDR="https://vault.thegriffinshome.com" 

# Enable the secrets engine
vault auth enable kubernetes

# Configure the engine (example)
vault write auth/kubernetes/config \
  kubernetes_host=https://192.168.1.170:6443 \
  kubernetes_ca_cert="$(kubectl config view --raw -o jsonpath='{.clusters[0].cluster.certificate-authority-data}' | base64 -d)"

# Create the policy and assign it to the role in one go
vault policy write external-secrets-policy - <<EOF
path "homelab/data/*" {
  capabilities = ["read"]
}
path "homelab/metadata/*" {
  capabilities = ["list"]
}
EOF

vault write auth/kubernetes/role/external-secrets-operator \
  bound_service_account_names=vault \
  bound_service_account_namespaces=default \
  audience="https://kubernetes.default.svc.cluster.local" \
  policies="external-secrets-policy" \
  ttl=1h

kubectl apply -f manifests.yaml