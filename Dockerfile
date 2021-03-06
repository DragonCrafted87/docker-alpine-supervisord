FROM dragoncrafted87/alpine:latest

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="DragonCrafted87 Alpine Supervisord" \
      org.label-schema.description="Alpine Image with additional controls from supervisord to enable gracefull server shudown." \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/DragonCrafted87/docker-alpine-supervisord" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

COPY root/. /

RUN apk add --update supervisor && \
    rm  -rf /tmp/* /var/cache/apk/* && \
    mkdir -p /etc/supervisord.conf.d && \
    chmod +x -R /scripts/*

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

CMD ["/docker_service_init"]
