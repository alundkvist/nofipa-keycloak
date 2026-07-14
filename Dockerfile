ARG KEYCLOAK_VERSION=26.5.5
FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION}

COPY --chown=keycloak:keycloak themes/nofipa /opt/keycloak/themes/nofipa
