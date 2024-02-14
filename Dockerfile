FROM postgres:alpine3.19

# Add infisical executable
RUN apk add --no-cache bash curl && curl -1sLf \
'https://dl.cloudsmith.io/public/infisical/infisical-cli/setup.alpine.sh' | bash \
&& apk add infisical

# Inject env variable into process
ENTRYPOINT ["sh", "-c", "infisical run --env=${ENV} --path=${INFISICAL_PATH:-/} -- docker-entrypoint.sh postgres"]