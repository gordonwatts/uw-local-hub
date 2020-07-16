# Config

This will setup a server that is authenticated using github as a login point.

## Running

### One time config

```bash
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update
kubectl create namespace jhub
kubectl --namespace jhub apply -f .\pv-cache.yaml
kubectl --namespace jhub apply -f .\pvc-cache.yaml
```

Next, you have to modify the `pv-cache.yaml` and `pvc-cache.yaml` to include the proper path on your machine for the `servicex-cache` and also the maximum size (100 GB??).

You'll need a second config file that is per-site that contains the "secret" info:

```yaml
proxy:
  secretToken: "<from openssl rand -hex 32>"

auth:
  github:
    clientId: "<from OAuth on github>"
    clientSecret: "<from OAuth on github>"
    callbackUrl: "http://<url>/hub/oauth_callback"
```

### Then to start it up

```bash
helm upgrade  --namespace jhub --install jhub jupyterhub/jupyterhub --version=0.9.0 --values .\config.yaml --values ..\jhub-local-config.yaml
```
