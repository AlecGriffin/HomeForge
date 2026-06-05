# Homelab Deploy 

Scripts to deploy homelab

## K8s Cluster Deployment

1. Deploy K8s Cluster 
2. Install Fluxcd
3. Setup Fluxcd Gitlab Token Secret 
4. Deploy component repo GitRepository / Kustomization (Will cause all components / component configurations to install)
5. Trigger scripts to configure cluster with external actors (e.g. Configure Hashicorp Vault connection, Configure External DNS w/ Pi-Hole, Configure Storage?)
   