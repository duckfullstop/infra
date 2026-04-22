# infra.duck.

This monorepo contains all the infrastructure declaration for my stuff.

## Directories

* _k8s_ holds YAML manifests for deployment onto the cluster.
* _nixos_ contains the NixOS declarations for hosts running the cluster.
* _terraform_ handles infrastructure-as-code duties (and is in control of deploying the declarations contained within the previous two directories).
