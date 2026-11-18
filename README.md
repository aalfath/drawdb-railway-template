[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/drawdb-2?utm_medium=integration&utm_source=button&utm_campaign=drawdb)

# drawDB on Railway

One-click Railway template for [drawDB](https://github.com/drawdb-io/drawdb), a free, open-source (AGPL-3.0) database diagram editor and SQL generator that runs in the browser.

## What it deploys

| Service | Source | Notes |
|---|---|---|
| `drawDB` | this repo (`Dockerfile`) | Official image `ghcr.io/drawdb-io/drawdb:v1.9.0`, pinned by digest `sha256:8239ebdd…6ce6fbd4`; nginx listens on Railway's `PORT`; health check `/healthz`; public Railway domain |

- **Version:** drawDB 1.9.0 (released 2026-11-01).
- **No database and no volume, on purpose.** drawDB keeps diagrams in each visitor's browser (IndexedDB). The server only serves the static app, so there is nothing on the server to lose on a redeploy. Use **File → Export / Save as** to keep a `.ddb` or `.json` copy, or to move a diagram to another browser.
- **No login and no secrets.** There is no admin UI and no server-side account, so nothing needs a password.

## Variables

None are required. Railway sets `PORT` itself.

| Variable | Default | What it does |
|---|---|---|
| `VITE_BACKEND_URL` | empty | Optional. URL of a [drawdb-server](https://github.com/drawdb-io/drawdb-server) for the "Share" link and the bug-report form. Without it, sharing is off; everything else works. |
| `VITE_GIST_BACKEND_URL` | empty | Optional. Separate server for gist-based sharing; falls back to `VITE_BACKEND_URL`. |

Both are read when the container starts, so changing them only needs a restart, not a rebuild.

## Updates

The service builds from this repo's `main` branch. When we bump the pinned drawDB version here, Railway shows deployers an "update available" notice and they choose when to apply it. Every change is listed in [CHANGELOG.md](CHANGELOG.md), breaking changes first.

## Run locally

```sh
docker compose up --build
# open http://localhost:8080 (health: http://localhost:8080/healthz)
```

## Licence

drawDB is © its authors under AGPL-3.0. This wrapper (Dockerfile and nginx config) is published under the same licence.
