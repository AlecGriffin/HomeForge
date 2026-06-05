# Setup self-hosted Gitlab + Gitlab Runner

## Pre-Requisites
- Must have a valid certificate for hostname (Need to setup NGINX Proxy Manager first)
- Setup ssh with port 2222 to allow sshing into the server running gitlab along with gitlab ssh clones

### Setup Volumes

#### Manually

Setup the following volume directories
```bash
sudo mkdir -p /Users/alecgriffin/srv/gitlab/{config,logs,data}
sudo chown -R $(whoami):staff /Users/alecgriffin/srv/gitlab
```

#### Using Docker Managed Volumes

```yaml
    ...
    volumes:
      - gitlab_config:/etc/gitlab
      - gitlab_logs:/var/log/gitlab
      - gitlab_data:/var/opt/gitlab
    shm_size: '256m'

volumes:
  gitlab_config:
  gitlab_logs:
  gitlab_data:
```

## Installation

Install gitlab using the following docker compose command
```bash
docker compose up -d
```

