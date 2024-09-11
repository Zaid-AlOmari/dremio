
# https://min.io/docs/minio/kubernetes/upstream/operations/install-deploy-manage/deploy-operator-helm.html

helm repo add minio-operator https://operator.min.io

helm install \
  --namespace lakehouse-minio-operator \
  --create-namespace \
  operator minio-operator/operator


helm upgrade --install global minio-operator/tenant -f values.yaml -n lakehouse-minio