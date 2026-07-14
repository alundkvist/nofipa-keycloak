# Keycloak image

This directory builds the Keycloak image used by Coolify. It extends the
official, version-pinned Keycloak image with the `nofipa` login theme; realm
configuration and database state remain external to the image.

| Path | Description |
|---|---|
| `Dockerfile` | Version-pinned Keycloak image with the theme installed. |
| `themes/nofipa/` | Login theme shared by the staff and customer realms. |

In Coolify, build with this directory as the context and `Dockerfile` as the
Dockerfile path. Keep the existing Keycloak command, environment variables,
networking, and PostgreSQL storage unchanged.
