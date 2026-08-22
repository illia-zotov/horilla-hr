# nginx image for the Coolify stack.
#
# The config is baked in rather than bind-mounted. Coolify does not run Compose
# from the cloned repository: it rewrites relative bind mounts to
# /data/coolify/applications/<uuid>/... and pre-creates any missing source path
# as a DIRECTORY. `./docker/nginx.conf:/etc/nginx/nginx.conf:ro` therefore fails
# at container init with "not a directory: Are you trying to mount a directory
# onto a file?". Building the file into the image sidesteps the host filesystem
# entirely and keeps the config versioned with the repo.
FROM nginx:alpine

COPY docker/nginx.conf /etc/nginx/nginx.conf
