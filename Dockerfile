# drawDB packaged for Railway.
# Official image, pinned by version and digest (multi-arch index: linux/amd64 + linux/arm64).
FROM ghcr.io/drawdb-io/drawdb:v1.9.0@sha256:8239ebdde4e23b35da2e68fc6ea158bffb6e59dad09abc7d1b1234d66ce6fbd4

# Railway sends traffic and health checks to $PORT. The nginx entrypoint renders
# /etc/nginx/templates/*.template with envsubst at start, so the port and the optional
# share backend URLs are read at runtime.
ENV PORT=8080 \
    VITE_BACKEND_URL="" \
    VITE_GIST_BACKEND_URL=""

COPY default.conf.template /etc/nginx/templates/default.conf.template

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
