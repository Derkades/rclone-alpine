docker run --rm --privileged docker/binfmt:66f9012c56a8316f9244ffd7622d7c21c1f6f28d
export DOCKER_CLI_EXPERIMENTAL=enabled
docker buildx rm rclone_builder
docker buildx create --use --name rclone_builder
docker buildx build -t derkades/rclone-alpine --platform=linux/arm,linux/arm64,linux/amd64 . --push
docker buildx rm rclone_builder
