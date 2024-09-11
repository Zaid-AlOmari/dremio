

docker build . -t dremio-mongo:latest
docker tag dremio-mongo:latest localhost:5000/dremio-mongo:latest
docker push localhost:5000/dremio-mongo:latest

kubectl create namespace lakehouse-dremio

helm repo add bitnami https://charts.bitnami.com/bitnami

helm upgrade --install -n lakehouse-dremio -f values.yaml dremio oci://registry-1.docker.io/bitnamicharts/dremio

