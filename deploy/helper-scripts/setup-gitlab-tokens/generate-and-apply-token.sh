#!/bin/bash

# Code Overview:
# - Exports GitLab authentication environment variables.
# - Checks for an existing, active, and unrevoked GitLab project access token named `flux-token`.
# - Extracts the token's ID and expiration date if it exists.
# - Determines if the token is about to expire within 7 days.
# - Creates a new token if none exists.
# - Rotates the token if it is expiring soon.
# - Stores a new or rotated token in HashiCorp Vault if generated.
# - Retrieves the token from Vault for use.
# - Creates or updates a Kubernetes secret with the token for FluxCD authentication.
# - Outputs status messages for each action.


# TODO: DO NOT COMMIT THIS
export GITLAB_TOKEN=glpat-aEKQ8JP68FH4SJRl4lbRGG86MQp1OjEH.01.0w0qdx3p1
export GITLAB_HOST="gitlab.thegriffinshome.com"

# Check if flux-token already exists
TOKEN_INFO=$(glab api "projects/homelab%2Fplatform-manifests/access_tokens?per_page=100" | jq '.[] | select(.name=="flux-token" and .active==true and .revoked==false)')

if [ -n "$TOKEN_INFO" ]; then
  EXISTING_TOKEN_ID=$(echo "$TOKEN_INFO" | jq -r '.id // empty')
  EXPIRES_AT=$(echo "$TOKEN_INFO" | jq -r '.expires_at // empty')
else
  EXISTING_TOKEN_ID=""
  EXPIRES_AT=""
fi

# # Set threshold (in days) for rotation
ROTATE_THRESHOLD_DAYS=7

should_rotate=false
if [ -n "$EXISTING_TOKEN_ID" ]; then
  if [ -n "$EXPIRES_AT" ]; then
    # Convert expires_at to seconds since epoch
    expires_at_epoch=$(date -j -f "%Y-%m-%d" "${EXPIRES_AT:0:10}" "+%s")
    now_epoch=$(date "+%s")
    # Calculate days until expiry
    days_until_expiry=$(( (expires_at_epoch - now_epoch) / 86400 ))
    if [ "$days_until_expiry" -le "$ROTATE_THRESHOLD_DAYS" ]; then
      should_rotate=true
    fi
  fi
fi

if [ -z "$EXISTING_TOKEN_ID" ]; then
  # Create token if it doesn't exist
  FLUXCD_GITLAB_TOKEN=$(glab token create flux-token --repo homelab/platform-manifests \
      --access-level owner \
      --scope read_repository  \
      --description "Allows fluxcd to read git repositories" \
      --expires-at "2026-10-29")

  echo $FLUXCD_GITLAB_TOKEN

  echo "Created new token."
elif [ "$should_rotate" = true ]; then
  FLUXCD_GITLAB_TOKEN=$(glab token rotate flux-token --repo homelab/platform-manifests --duration 8760h)
  echo "Token 'flux-token' is expiring soon. Rotated token."
else
  echo "Token 'flux-token' is valid and not expiring soon. No rotation needed."
  # Optionally, you may want to exit or handle the token value here
  FLUXCD_GITLAB_TOKEN=""
fi

# If token new/rotated token has been generated, store in vault
if [ -n "$FLUXCD_GITLAB_TOKEN" ]; then
  vault kv put -address https://vault.thegriffinshome.com -mount=homelab flux-gitlab-token flux-gitlab-token=$FLUXCD_GITLAB_TOKEN
  echo "Stored new token within vault."
else
  echo "No new or rotated token available. Secret not created."
fi

# # Retrieve token from vault
FLUXCD_GITLAB_TOKEN=$(vault kv get -address https://vault.thegriffinshome.com -field=flux-gitlab-token -mount="homelab" "flux-gitlab-token")

echo "Token: ${FLUXCD_GITLAB_TOKEN}"

# # Add token to gitlab
kubectl create secret generic fluxcd-gitlab-token \
  --from-literal=username="alecgriffin" \
  --from-literal=password="$FLUXCD_GITLAB_TOKEN" \
  --namespace="flux-system" \
  --dry-run=client -o yaml | kubectl apply -f -