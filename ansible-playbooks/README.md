# Homelab Ansible Playbooks

Ansible playbooks used to generate homelab setup

## SSH Configuration

[Docs](https://docs.ansible.com/ansible/latest/inventory_guide/connection_details.html)

### Manually approve kubelet serving certificates

Kubelet Serving Certificates Signing Requests are not approved by default when using kubeadm as shown in the below example
```bash
$ kubectl get csr

csr-47xtw   14m   kubernetes.io/kubelet-serving                 system:node:hera          <none>              Pending
```

To fix this, run the following command to approve all kubelet serving certificate signing requests:
```bash
kubectl get csr  --no-headers | awk '{print $1}' | xargs kubectl certificate approve
```
