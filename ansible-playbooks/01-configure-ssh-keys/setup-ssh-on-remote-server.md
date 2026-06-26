# Generate Key

```bash
ssh-keygen -t ed25519 -f k8s-nodes 
```

<!-- Non-K8s Hosts -->
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub alecgriffin@hermes

ssh-copy-id -i ~/.ssh/id_rsa.pub alecgriffin@athena
```

<!-- Setup Control Planes -->
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub alecgriffin@zeus

ssh-copy-id -i ~/.ssh/id_rsa.pub alecgriffin@hades

ssh-copy-id -i ~/.ssh/id_rsa.pub alecgriffin@poseidon
```

<!-- Setup Worker Nodes -->
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub alecgriffin@apollo

ssh-copy-id -i ~/.ssh/id_rsa.pub alecgriffin@ares

ssh-copy-id -i ~/.ssh/id_rsa.pub alecgriffin@artemis

ssh-copy-id -i ~/.ssh/id_rsa.pub alecgriffin@hera

ssh-copy-id -i ~/.ssh/id_rsa.pub alecgriffin@aphrodite
```