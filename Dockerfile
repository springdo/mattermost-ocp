FROM mattermost/mattermost-prod-app

# Build argument to set Mattermost edition
ARG edition=team

# OCP Fix Perms
RUN chgrp -R 0 /mattermost \
  && chmod -R g+rwX /mattermost

COPY config.json /mattermost/config/config.json
# Using the MM_CONFIG created TODO use config map
# CMD /entrypoint.sh platform -c ${MM_CONFIG}
CMD platform -c /mattermost/config/config.json
