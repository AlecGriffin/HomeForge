rm -rf ./vault-volumes/
mkdir -p ./vault-volumes/{config,file,logs,certs}
cp ./config.hcl ./vault-volumes/config