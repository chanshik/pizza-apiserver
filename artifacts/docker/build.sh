export GOOS=linux; go build -o pizza-apiserver .
cp ./pizza-apiserver ./artifacts/docker/
docker build -t registry.chanshik.dev/pizza-apiserver:latest ./artifacts/docker
docker push registry.chanshik.dev/pizza-apiserver:latest