set -e
docker build -t derkades/rclone-alpine-test --no-cache .
docker run --rm derkades/rclone-alpine-test rclone --version
docker image rm derkades/rclone-alpine-test

export DOCKER_CLI_EXPERIMENTAL=enabled
docker buildx build -t derkades/rclone-alpine --platform=linux/arm,linux/arm64,linux/amd64 . --push
