# Home Forge


## Build Process
1. Configure Hosts
2. Build K8s Cluster
3. Install Components
4. Deploy Applications


## Upgrade

### Replace
1. Upgrade Control Plane **[Perform Until all nodes upgraded]**
   1. Take out single control plane node
   2. Upgrade / Update Host (Configure host for new version of k8s)
   3. Restart core k8s processes
   4. Rejoin node back to cluster
2. Upgrade Worker Node **[Perform Until all nodes upgraded]**
   1. Take out worker node
   2. Upgrade / Update Host (Configure host for new version of k8s)
   3. Restart core k8s processes
   4. Rejoin node back to cluster

### In Place
1. Delete Hosts
2. Configure Hosts
3. Build K8s Cluster
4. Install Components
5. Deploy Applications
