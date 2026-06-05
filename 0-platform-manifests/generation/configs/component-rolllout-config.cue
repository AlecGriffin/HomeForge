components: [
  // "external-dns",
  // "longhorn",
  // "cert-manager",
  // "argocd",
  // "headlamp",
  "external-secrets-operator",
  "ingress-nginx",
  "metallb"
]

kustomize: {
  apiVersion: "kustomize.config.k8s.io/v1beta1"
  kind:       "Kustomization"
  resources:  [for c in components {"\(c).yaml"}]
}

kustomizations: [ for c in components {
  apiVersion: "kustomize.toolkit.fluxcd.io/v1"
  kind:       "Kustomization"
  metadata: {
    name:      c
    namespace: "flux-system"
  }
  spec: {
    interval:  "5m"
    sourceRef: {
      kind: "GitRepository"
      name: "platform-manifests"
    }
    path:    "./platform/components/\(c)"
    prune:   true
    timeout: "1m"
  }
}]