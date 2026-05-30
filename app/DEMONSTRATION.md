# Task B2 & B3: Demonstration Guide

## Task B2: Docker Networking
Demonstrate inter-container communication by name on a custom bridge network.

### Verification via Docker Compose:
```bash
# Verify nginx can reach flask-api by name
docker compose exec nginx ping -c 2 flask-api

# Verify flask-api can reach mysql by name
docker compose exec flask-api ping -c 2 mysql
```

## Task B3: Docker Volumes
Demonstrate that data survives a container restart using the named volume `mysql-data`.

### Verification Steps:
1. **Insert Data:**
   ```bash
   curl -X POST http://localhost/api/items -H "Content-Type: application/json" -d '{"name": "Item 1"}'
   ```
2. **Restart:**
   ```bash
   docker compose down
   docker compose up -d
   ```
3. **Verify:**
   ```bash
   curl http://localhost/api/items
   ```
   *Expected: Data still exists.*
