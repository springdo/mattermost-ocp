# mattermost-ocp

WIP  repo

## Set the following VARS when running the image eg
```bash
MM_USERNAME=db_username
MM_PASSWORD=db_pass
MM_DBNAME=mattermost
DB_HOST=db.namespace.svc.cluster.local
DB_PORT_NUMBER=5432
```

## TODO
1. Create template for the Postgres db
1. Create a config map for the `config.json`
1. Add smtp settings
1. Add LDAP settings for single auth
