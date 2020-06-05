set -e
export DOCKER_CLI_EXPERIMENTAL=enabled
docker buildx build -t derkades/rclone-alpine --platform=linux/arm,linux/arm64,linux/amd64 . --push
