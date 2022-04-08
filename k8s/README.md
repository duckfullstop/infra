# k8s.infra.duck.

This directory defines all of the kubernetes manifests for my infrastructure.

These are pulled by each cluster automatically using [flux](https://fluxcd.io/).


## Sealed Secrets

The secrets in this repository are sealed using Bitnami's [sealed-secrets](https://github.com/bitnami-labs/sealed-secrets) controller, which means they can be committed here publically in git without leaking sensitive information.

**MANIFESTS WITH `kind: Secret` MUST NOT BE COMMITTED UNDER ANY CIRCUMSTANCES.** (TODO: Add a git pre-commit hook to catch this)

To seal a secret:

```
kubeseal --format=yaml --cert=infra/[cluster]/seal-secrets.pem < plain-secret.yaml > sealed-secret.yaml
```

To update an existing sealed secret, use something like the following:

```
echo -n baz | kubectl create secret generic mysecret --dry-run=client --from-file=bar=/dev/stdin -o yaml \
  | kubeseal --format=yaml --cert=infra/[cluster]/seal-secrets.pem --merge-into secret.yaml
```