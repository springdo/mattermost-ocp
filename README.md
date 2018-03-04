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

+ Create a config map from the template provided by substituting the variables below with your own
```
oc process -f mattermost-config.yml \
        -p SITE_URL=mattermost.somesite.com \
        -p SMTP_PASSWORD=password \
        -p SMTP_USERNAME=noreply.mattermosts@gmail.com \
        -p GITLAB_OATUH_SECRET=123 \
        -p GITLAB_OAUTH_ID=123 \
        -p GITLAB_URL=gitlab.somesite.com \
        -p POSTGRESQL_PASSWORD=password \
        -p POSTGRESQL_SERVICE=postgresql.namespace.svc.cluster.local \
         | oc create -f -
```

+ Create a deployment for the mattermost app
```
oc process -f mattermost.yml | oc create -f -
```

## TODO
1. Create template for the Postgres db
1. Create a config map for the `config.json`
1. Add smtp settings
1. Add LDAP settings for single auth
