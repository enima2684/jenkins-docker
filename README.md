# Build command
docker buildx bake --push -f docker-compose.yml --set *.platform=linux/amd64,linux/arm64

docker-compose build
docker-compose push