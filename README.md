# Space App API

## Installation (with Docker)

### Dév

```bash
    git clone git@github.com:MaximeBiechy/spaceapp-api.git
    cd spaceapp-api
    docker compose --env-file .env.dev -f docker-compose.dev.yml up --build -d
```

### Prod

```bash
    git clone git@github.com:MaximeBiechy/spaceapp-api.git
    cd spaceapp-api
    docker compose --env-file .env.dev up --build
```
