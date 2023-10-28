A simple Docker container with an oauth2-proxy
==============================================

See more under [https://oauth2-proxy.github.io/oauth2-proxy/docs/]{https://oauth2-proxy.github.io/oauth2-proxy/docs/}

And [Overview]{https://oauth2-proxy.github.io/oauth2-proxy/docs/configuration/overview}

Run it
------

```bash
sudo podman run --rm  img_oauth2-proxy:latest --version
```

Build
-----

```bash
sudo podman login docker.io
LATES_VERSION=0.0.1
sudo podman build -t oauth2-proxy:latest --no-cache=true .
sudo podman tag  oauth2-proxy:latest  olafradicke/oauth2-proxy:${LATES_VERSION}
sudo podman push olafradicke/oauth2-proxy:${LATES_VERSION}
```


Test
----

```bash
sudo  podman run --rm olafradicke/oauth2-proxy:0.0.1 --version
```


```bash
COOKIE_SECRET=$(dd if=/dev/urandom bs=32 count=1 2>/dev/null | base64 | tr -d -- '\n' | tr -- '+/' '-_'; echo)
sudo  podman run --rm \
-p 4180:4180 \
olafradicke/oauth2-proxy:0.0.1 \
--cookie-secret ${COOKIE_SECRET} \
--http-address 127.0.0.1:4180 \
--upstream https://hese.de \
    --provider=keycloak-oidc \
    --client-id=your-clients-id \
    --client-secret=your-clients-secret \
    --redirect-url=https://internal.yourcompany.com/oauth2/callback \
    --oidc-issuer-url=https://keycloak-host/realms/your-realm \
    --email-domain=olaf-radicke.de \
    --allowed-role=realm-role-name \
    --allowed-role=client-id:client-role-name \
    --allowed-group=group-name \
    --code-challenge-method=S256
```