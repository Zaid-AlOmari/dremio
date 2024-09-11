
docker build . -t superset:latest

docker tag superset:latest localhost:5000/superset:latest
docker push localhost:5000/superset:latest

kubectl apply -f apache-superset.yaml -n lakehouse-superset
kubectl apply -f mongo-ro.yaml -n lakehouse-mongo