FROM mattermost/mattermost-prod-app

# Build argument to set Mattermost edition
ARG edition=team

# OCP Fix Perms
RUN chgrp -R 0 /mattermost \
  && chmod -R g+rwX /mattermost

# Used for local testing if you want to move in some test config.
# OCP template adds config map to this location anyway 
COPY config.json /mattermost/config/config.json

CMD platform -c /mattermost/config/config.json
