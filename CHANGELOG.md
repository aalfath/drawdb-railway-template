# Changelog

Breaking changes are listed first in each entry.

## 1.9.0 (2026-11-18)

- First release of this template: drawDB 1.9.0 from `ghcr.io/drawdb-io/drawdb:v1.9.0@sha256:8239ebdde4e23b35da2e68fc6ea158bffb6e59dad09abc7d1b1234d66ce6fbd4`.
- nginx listens on Railway's `PORT` (default 8080) and answers `/healthz` for the health check.
- Optional `VITE_BACKEND_URL` / `VITE_GIST_BACKEND_URL` for a drawdb-server (sharing), read at container start.
