    
    export KUBECONFIG=/Users/alecgriffin/Developer/homelab/homelab-deploy/helper-scripts/setup-user-auth/kubeconfig.yaml

    export CONTROL_PLANE_ENDPOINT="https://192.168.1.60:6443"

    export K8S_TOKEN=TEST_TOKEN
    
    kubectl config set-cluster kubernetes --server=${CONTROL_PLANE_ENDPOINT} --insecure-skip-tls-verify=true
    kubectl config set-credentials oidc-token --token=${K8S_TOKEN}
    kubectl config set-context kubernetes --cluster=kubernetes --user=oidc-token --namespace=default
    kubectl config use-context kubernetes