ARG RHEL_VERSION=8

FROM registry.access.redhat.com/ubi8/ubi
LABEL maintainer "Bitnami <containers@bitnami.com>"

ENV HOME="/" \
    OS_ARCH="amd64" \
    OS_FLAVOUR="debian-10" \
    OS_NAME="linux"

COPY prebuildfs /
# Install required system packages and dependencies
RUN install_packages tar

COPY rootfs /

EXPOSE 5432

USER 1001
ENTRYPOINT [ "/opt/bitnami/scripts/postgresql-repmgr/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/postgresql-repmgr/run.sh" ]
