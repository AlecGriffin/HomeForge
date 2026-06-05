api_addr = "https://vault.thegriffinshome.com"
cluster_addr = "http://192.168.1.108:8201"
disable_mlock           = true
ui                      = true

listener "tcp" {
    address       = "0.0.0.0:8200"
    tls_disable = "true"
    # tls_cert_file = "/tmp/vault-cert.pem"
    # tls_key_file  = "/tmp/vault-key.pem"
}

storage "raft" {
    path    = "vault/data"
    node_id = "node1"
}