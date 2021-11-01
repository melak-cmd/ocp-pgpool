ARG RHEL_VERSION=8

FROM registry.access.redhat.com/ubi8/ubi
LABEL maintainer "Bitnami <containers@bitnami.com>"

ENV HOME="/" \
    OS_ARCH="amd64" \
    OS_FLAVOUR="ubi-8" \
    OS_NAME="linux"

COPY prebuildfs /
# Install required system packages and dependencies
RUN install_packages acl ca-certificates curl gzip tar
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "postgresql-repmgr" "14.0.0-4" --checksum 1a5bc3d48132b3cac7797d18b7cbe939fd3ee95db3538a75ae62a159f0f1ca96

COPY rootfs /

EXPOSE 5432

USER 1001
ENTRYPOINT [ "/opt/bitnami/scripts/postgresql-repmgr/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/postgresql-repmgr/run.sh" ]
