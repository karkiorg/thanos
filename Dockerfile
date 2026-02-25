# By default we pin to amd64 sha. Use make docker to automatically adjust for arm64 versions.

FROM quay.io/prometheus/busybox
LABEL maintainer="The Thanos Authors"

RUN adduser \
    -D `#Dont assign a password` \
    -H `#Dont create home directory` \
    -u 1001 `#User id`\
    thanos

COPY --chown=thanos /thanos_tmp_for_docker /bin/thanos

USER 1001
ENTRYPOINT [ "/bin/thanos" ]
