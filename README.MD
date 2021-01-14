Dockerfile

docker-compose.yml

terraform 0.13.6

terraform init
terraform apply -auto-approve

Установка gitlab
helm3
yc managed-kubernetes cluster get-credentials otus-cluster --external
helm3 repo add gitlab https://charts.gitlab.io
helm3 fetch gitlab/gitlab --untar
cd gitlab
certmanager-issuer
helm3 upgrade --install gitlab .
заменить domain 178-154-226-58.sslip.io
helm3 upgrade --install gitlab .
kubectl get secret gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode ; echo

