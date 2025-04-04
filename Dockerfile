FROM tailscale/tailscale:v1.82.0

ENV PORT="41641"
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ENV TS_ACCEPT_DNS="true"
ENV TS_ENABLE_HEALTH_CHECK="true"
ENV TS_EXTRA_ARGS="--accept-routes --advertise-exit-node --force-reauth"
ENV TS_TAILSCALED_EXTRA_ARGS="--verbose=1 --port 41641 --state=mem:"
