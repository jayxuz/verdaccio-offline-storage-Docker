# verdaccio-offline-storage Docker Image

[![docker pulls](https://img.shields.io/docker/pulls/jayxuz/verdaccio-offline-storage.svg?maxAge=43200)](https://hub.docker.com/r/jayxuz/verdaccio-offline-storage)
[![docker pulls](https://img.shields.io/docker/image-size/jayxuz/verdaccio-offline-storage/latest)](https://hub.docker.com/r/jayxuz/verdaccio-offline-storage)
```bash
docker pull jayxuz/verdaccio-offline-storage
```

## Docker Image Usage
Edit the `config.yaml` with the following:

```yaml
# The plugin will use the `storage` field just like the default `local-storage` plugin does
storage: /path/to/the/storage/cache/directory/

# Add this and Verdaccio will load the plugin 
store:
  offline-storage:

# Now on, every package with no `proxy` defined will be resolved locally!
```
```yaml
# Optionally, if you want to resolve locally EVERY package (like in the v1 version of this plugin)
# just add this to the config:
offline: true
```

And voilá, enjoy your working offline environment.

---