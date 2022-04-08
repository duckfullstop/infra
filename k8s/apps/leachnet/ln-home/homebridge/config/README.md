homebridge requires a config.json to boot, but that contains secrets, so we kind of have to commit the entire file as a sealed secret (see secret.yaml).

Eventually (hopefully) homebridge will support envvar replacement, but until then, this janky workaround will have to do.
