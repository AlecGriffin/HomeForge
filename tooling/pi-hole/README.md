# pi-hole-configuration

Home configuration for Pi-Hole


## Documentation

https://github.com/pi-hole/docker-pi-hole

## Nginx Proxy manager Configuration

In nginx-proxy-manager, under the Proxy Host settings for `pihole.thegriffinshome.com`:
- Go to the “Advanced” tab.
- Add this line to the custom Nginx configuration


```txt
proxy_set_header Host $host;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto $scheme;
```

### Purporse

These headers help the backend (Pi-hole) correctly identify the original request’s domain, protocol, and client IP, which is important for authentication, logging, and correct web behavior behind a reverse proxy.

```
proxy_set_header Host $host;
```
- Ensures the original domain (e.g., pihole.thegriffinshome.com) is sent to the backend (Pi-hole), not the internal Docker hostname. This is important for apps that check the Host header.

```
proxy_set_header X-Real-IP $remote_addr;
```
- Passes the real client’s IP address to the backend, so Pi-hole can see who is connecting.

```
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
```
- Adds the client’s IP to the X-Forwarded-For header, which is used for logging and access control.

```
proxy_set_header X-Forwarded-Proto $scheme;
```
- Tells the backend whether the original request was HTTP or HTTPS.