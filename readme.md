# Postgres Infisical

## 🚩 Introduction

Slight extension of the postgres docker image, injecting env variables originating from Infisical into the postgres 
process. The main use case of this image is with docker-compose, allowing the database initialization to use environment
variables from an infisical instance. 

## Usage: 

Prepare a .env file containing the following data: 

```dotenv
INFISICAL_TOKEN=authentication_token_for_infisical
INFISICAL_API_URL=https://url.of.self-hosted.infisical.instance/api
ENV=infisical_environment_slug
PATH=/optional/path/to/the/secrets/folder
```

This file can then be added to your docker-compose file as follows. 

```yaml
services:
  db:
    image: baeriswyln/postgres-infisical
    env_file:
      - .env
    ports:
      - "5432:5432"
    volumes:
      - postgres-db:/var/lib/postgresql/data

volumes:
  postgres-db:
```