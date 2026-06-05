# TODO:
# - Loops?
# - How can this be simplified (reduce duplication without convoluting things)
# - Investigate gitlab lag issues

# --- Paths --- #
COMPONENT_FOLDER_PATH="../platform/components"

# --- Versions --- #
external_dns_version="v1.19.0"
longhorn_version="1.10.1"
external_secrets_operator_version="1.0.0"
cert_manager_version="1.19.1"
argocd_version="9.0.3"
fluxcd_version="2.17.1"
ingress_nginx_version="4.14.0"
metallb_version="0.15.2"
nats_version="2.12.1"
headlamp_version="0.39.0"
victoria_metrics_operator_version="0.56.4"

# --- Values --- #
external_dns_values="${COMPONENT_FOLDER_PATH}/external-dns/values.yaml"
longhorn_values="${COMPONENT_FOLDER_PATH}/longhorn/values.yaml"
external_secrets_operator_version_values="${COMPONENT_FOLDER_PATH}/external-secrets-operator/values.yaml"
cert_manager_values="${COMPONENT_FOLDER_PATH}/cert-manager/values.yaml"
argocd_values="${COMPONENT_FOLDER_PATH}/argocd/values.yaml"
fluxcd_values="${COMPONENT_FOLDER_PATH}/fluxcd/values.yaml"
ingress_nginx_values="${COMPONENT_FOLDER_PATH}/ingress-nginx/values.yaml"
metallb_values="${COMPONENT_FOLDER_PATH}/metallb/values.yaml"
nats_values="${COMPONENT_FOLDER_PATH}/nats/values.yaml"
headlamp_values="${COMPONENT_FOLDER_PATH}/headlamp/values.yaml"
victoria_metrics_operator_values="${COMPONENT_FOLDER_PATH}/victoria-metrics/values.yaml"

# Update helm repositories to retrieve latest versions
helm repo update

# -------------------- #
# --- external-dns --- #
# -------------------- #

helm repo add external-dns https://kubernetes-sigs.github.io/external-dns/
helm template external-dns external-dns/external-dns --namespace external-dns --include-crds --version $external_dns_version -f $external_dns_values > ${COMPONENT_FOLDER_PATH}/external-dns/manifests.yaml

# ---------------- #
# --- longhorn --- #
# ---------------- #

helm repo add longhorn https://charts.longhorn.io
helm template longhorn longhorn/longhorn --namespace longhorn-system --include-crds --version $longhorn_version -f $longhorn_values > ${COMPONENT_FOLDER_PATH}/longhorn/manifests.yaml

# --------------------------------- #
# --- external-secrets-operator --- #
# --------------------------------- #

helm repo add external-secrets https://charts.external-secrets.io
helm template external-secrets external-secrets/external-secrets --namespace external-secrets-operator --include-crds --version $external_secrets_operator_version -f $external_secrets_operator_version_values > ${COMPONENT_FOLDER_PATH}/external-secrets-operator/manifests.yaml

# -------------------- #
# --- cert-manager --- #
# -------------------- #

helm repo add jetstack https://charts.jetstack.io
helm template cert-manager jetstack/cert-manager --namespace cert-manager --include-crds --version $cert_manager_version -f $cert_manager_values > ${COMPONENT_FOLDER_PATH}/cert-manager/manifests.yaml

# -------------- #
# --- ArgoCD --- #
# -------------- #

helm repo add argo https://argoproj.github.io/argo-helm
helm template argocd argo/argo-cd --namespace argo --include-crds --version $argocd_version -f $argocd_values > ${COMPONENT_FOLDER_PATH}/argocd/manifests.yaml


# -------------- #
# --- FluxCD --- #
# -------------- #

helm repo add fluxcd-community https://fluxcd-community.github.io/helm-charts
helm template fluxcd fluxcd-community/flux2 --namespace flux-system --include-crds --version $fluxcd_version -f $fluxcd_values > ${COMPONENT_FOLDER_PATH}/fluxcd/manifests.yaml

# --------------------- #
# --- Ingress-Nginx --- #
# --------------------- #

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm template ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --include-crds --version $ingress_nginx_version -f $ingress_nginx_values > ${COMPONENT_FOLDER_PATH}/ingress-nginx/manifests.yaml

# --------------- #
# --- Metallb --- #
# --------------- #

 helm repo add metallb https://metallb.github.io/metallb
 helm template metallb metallb/metallb --namespace metallb-system --include-crds --version $metallb_version -f $metallb_values > ${COMPONENT_FOLDER_PATH}/metallb/manifests.yaml

# ------------ #
# --- Nats --- #
# ------------ #

helm repo add nats https://nats-io.github.io/k8s/helm/charts/
helm template nats nats/nats --namespace nats --include-crds --version $nats_version -f $nats_values > ${COMPONENT_FOLDER_PATH}/nats/manifests.yaml


# ---------------- #
# --- Headlamp --- #
# ---------------- #

helm repo add headlamp https://kubernetes-sigs.github.io/headlamp/
helm template headlamp headlamp/headlamp --namespace headlamp --include-crds --version $headlamp_version -f $headlamp_values > ${COMPONENT_FOLDER_PATH}/headlamp/manifests.yaml

# ------------------------ #
# --- victoria-metrics --- #
# ------------------------ #

helm repo add victoria-metrics https://victoriametrics.github.io/helm-charts/
helm template victoria-metrics victoria-metrics/victoria-metrics-operator --namespace victoria-metrics --include-crds --version $victoria_metrics_operator_version -f $victoria_metrics_operator_values > ${COMPONENT_FOLDER_PATH}/victoria-metrics/manifests.yaml