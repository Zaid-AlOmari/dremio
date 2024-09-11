FROM bitnami/dremio:latest

USER root

RUN apt-get update && apt-get install -y wget tar

ARG DOWNLOAD_URL=https://download.dremio.com/community-server/25.1.0-202409042012430619-15cc6471/dremio-community-25.1.0-202409042012430619-15cc6471.tar.gz

USER 1001

RUN wget -q "${DOWNLOAD_URL}" -O dremio.tar.gz \
  && mkdir -p /opt/bitnami/dremio/output \
  && tar vxfz dremio.tar.gz -C /opt/bitnami/dremio/output --strip-components=1 \
  && rm -rf dremio.tar.gz \
  && rm -rf /opt/bitnami/dremio/jars \
  && cp -fR /opt/bitnami/dremio/output/jars/ /opt/bitnami/dremio/ \
  && rm -rf /opt/bitnami/dremio/output
