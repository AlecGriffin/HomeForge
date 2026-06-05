FLUXCD_GITLAB_TOKEN=$(vault kv get -address https://vault.thegriffinshome.com -field=flux-gitlab-token -mount="homelab" "flux-gitlab-token")

kubectl create secret generic fluxcd-gitlab-token \
    --from-literal=username="alecgriffin" \
    --from-literal=password="$FLUXCD_GITLAB_TOKEN" \
    --namespace="flux-system"