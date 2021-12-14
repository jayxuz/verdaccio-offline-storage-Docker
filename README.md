# Verdaccio-offline-storage Docker Image

[![docker pulls](https://img.shields.io/docker/pulls/jayxuz/verdaccio-offline-storage.svg?maxAge=43200)](https://hub.docker.com/r/jayxuz/verdaccio-offline-storage)
[![docker pulls](https://img.shields.io/docker/image-size/jayxuz/verdaccio-offline-storage/latest)](https://hub.docker.com/r/jayxuz/verdaccio-offline-storage)
```bash
docker pull jayxuz/verdaccio-offline-storage
```

# Verdaccio Offline Mode Preview
## Proxy Cache Access In Offline Mode
![Proxy Cache Access In Offline Mode](https://raw.githubusercontent.com/jayxuz/pic/main/verdaccio-offline-storage-preview-1.jpeg)
## Proxy Cache Has Different Version
![Proxy Cache Has Different Version](https://raw.githubusercontent.com/jayxuz/pic/main/verdaccio-offline-storage-preview-2.jpeg)
## Proxy Cache Store Different Version In Local Disk
![Proxy Cache Store Different Version In Local Disk](https://raw.githubusercontent.com/jayxuz/pic/main/verdaccio-offline-storage-preview-3.png)

# Docker Image Usage
## edit config.yaml
- You can copy this file initially from https://github.com/verdaccio/verdaccio/blob/5.x/conf/docker.yaml
- rename docker.yaml -> config.yaml
- Edit the `config.yaml` with the following:

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
- place `config.yaml` in the folder **conf**

## Quick Start
> Normally, if you don’t need to add plugins, just start Docker as follows command
```bash
V_PATH=/path/for/verdaccio # your storage path in local disk
docker run -it --rm --name verdaccio \
  -p 4873:4873 \
  -v $V_PATH/conf:/verdaccio/conf \
  -v $V_PATH/storage:/verdaccio/storage \
  jayxuz/verdaccio-offline-storage
```

## Add More Plugins
> Because the offline module is placed in the **plugins** folder by soft connection  
If you need to add more plugins  
just run as follows command
```bash
V_PATH=/path/for/verdaccio # your storage path in local disk

# First, run the Image
docker run -it --rm --name verdaccio \
  jayxuz/verdaccio-offline-storage

# Then copy the module from Docker container in Admin(root) role
docker cp verdaccio:/usr/local/lib/node_modules/verdaccio-offline-storage $V_PATH/plugins

# finally, run the Docker image in normal method
docker run -it --rm --name verdaccio \
  -p 4873:4873 \
  -v $V_PATH/conf:/verdaccio/conf \
  -v $V_PATH/storage:/verdaccio/storage \
  -v $V_PATH/plugins:/verdaccio/plugins \
  verdaccio/verdaccio
```
enjoy your working offline environment.

---