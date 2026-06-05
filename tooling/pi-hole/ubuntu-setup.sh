# Disable DNS Stup Resolver, systemd-resolved, to free port 53 (which will be used by pi-hole)
sudo sed -r -i.orig 's/#?DNSStubListener=yes/DNSStubListener=no/g' /etc/systemd/resolved.conf

# This will not change the nameserver settings, which point to the stub resolver thus preventing DNS resolution. Change the /etc/resolv.conf symlink to point to /run/systemd/resolve/resolv.conf
sudo sh -c 'rm /etc/resolv.conf && ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf'

# Restart systemd-resolved
systemctl restart systemd-resolved