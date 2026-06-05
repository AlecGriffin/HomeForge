# Platform Manifests

## Versioning


| Component                  | Version   |
|----------------------------|-----------|
| external-dns               | v1.19.0   |
| longhorn                   | 1.10.0    |
| external-secrets-operator  | 1.0.0     |
| cert-manager               | 1.19.1    |
| ingress-nginx              | 1.14.0    |


## Components

### Networking
- cilium (managed by ansible) 
- external-dns

### Metrics
- prometheus / thanos -or- Victoria Metrics

### Storage
- longhorn

### Secret/Cert Managememnt
- external-secrets-operator
- cert-manager