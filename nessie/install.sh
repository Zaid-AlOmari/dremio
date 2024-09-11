
kubectl create namespace lakehouse-nessie

kubectl apply -f postgres-creds-secret.yaml

helm repo add nessie-helm https://charts.projectnessie.org
helm repo update

helm upgrade --intall -n lakehouse-nessie nessie nessie-helm/nessie