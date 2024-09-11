
helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade -n lakehouse-postgres --install postgres oci://registry-1.docker.io/bitnamicharts/postgresql

