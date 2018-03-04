# mattermost-ocp
Repository containing some slight customisations to the `team` edition of [Mattermost](https://docs.mattermost.com/) for running on OpenShift.

# Run instructions
+ Create a db for the application using the template provided or one built into OpenShift.
```
oc new-app \                                                                                           
    -e POSTGRESQL_USER=mattermost \
    -e POSTGRESQL_PASSWORD=password \
    -e POSTGRESQL_DATABASE=mattermost \
    postgresql:9.4
```

+ Create a config map from the template provided by completing the variables below
```
oc process -f mattermost-config.yml \
        -p SITE_URL= \
        -p SMTP_PASSWORD= \
        -p GITLAB_OATUH_SECRET= \
        -p GITLAB_OAUTH_ID= \
        -p GITLAB_URL= \
        -p POSTGRESQL_PASSWORD= \
        -p POSTGRESQL_SERVICE= \
         | oc create -f -
```

+ Create a deployment for the mattermost app
```

```

## TODO
1. Create template for the Postgres db
1. Create a config map for the `config.json`
1. Add smtp settings
1. Add LDAP settings for single auth
