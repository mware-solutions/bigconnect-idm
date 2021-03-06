FROM registry.access.redhat.com/ubi8-minimal

ENV KEYCLOAK_VERSION 11.0.0-SNAPSHOT
ENV JDBC_MARIADB_VERSION 2.6.0
ENV JDBC_MYSQL_VERSION 8.0.19

ENV LAUNCH_JBOSS_IN_BACKGROUND 1
ENV PROXY_ADDRESS_FORWARDING true
ENV JBOSS_HOME /opt/jboss/keycloak
ENV LANG en_US.UTF-8

ARG GIT_REPO=mware-solutions/bigconnect-idm
ARG GIT_BRANCH=master

USER root

RUN microdnf update -y && microdnf install -y glibc-langpack-en gzip hostname java-11-openjdk-headless openssl tar which && microdnf clean all

ADD docker/tools /opt/jboss/tools

COPY distribution/server-dist/target/keycloak-*.tar.gz /opt/jboss
RUN cd /opt/jboss && tar xfz keycloak-*.tar.gz
RUN rm -rf keycloak-*.tar.gz
RUN mv /opt/jboss/keycloak-$KEYCLOAK_VERSION /opt/jboss/keycloak/

RUN /opt/jboss/tools/build-keycloak.sh

USER 1000

EXPOSE 8080
EXPOSE 8443
EXPOSE 9797

USER root

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0"]
