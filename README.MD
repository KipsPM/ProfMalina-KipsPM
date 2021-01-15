add Dockerfile

add docker-compose.yml

use terraform 0.13.6

kluster up

`terraform init`
`terraform apply -auto-approve`
`yc managed-kubernetes cluster get-credentials otus-cluster --external`

install gitlab

use helm3

`helm3 repo add gitlab https://charts.gitlab.io`
`helm3 fetch gitlab/gitlab --untar`
`cd gitlab`

change certmanager-issuer
change domain 284-201-159-222.sslip.io
========
add gitlab-runner `privileged: true`
alternative https://github.com/GoogleContainerTools/kaniko
========
`helm3 upgrade --install gitlab .`

`kubectl get secret gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode ; echo`

gitlab-ci

add projects in gitlab

`git remote add origin git@gitlab.284-201-159-222.sslip.io:search_engine/ui.git`
`git remote add origin git@gitlab.284-201-159-222.sslip.io:search_engine/crawler.git`



`helm3 upgrade --install gitlab .`

add .gitlab-ci.yml

see
gitlab.284-201-159-222.sslip.io user:root password:otusgitlab

add `CI_REGISTRY_USER CI_REGISTRY_PASSWORD`

add kluster in gitlab
https://cloud.yandex.ru/docs/solutions/infrastructure-management/gitlab-containers
Cluster id
`yc managed-kubernetes cluster list --format=json | jq -r .[].id`
API URL
`yc managed-kubernetes cluster get $(yc managed-kubernetes cluster list --format=json | jq -r .[].id) --format=json | jq -r .master.endpoints.external_v4_endpoint`
CA Certificate
`yc managed-kubernetes cluster get $(yc managed-kubernetes cluster list --format=json | jq -r .[].id) --format=json | jq -r .master.master_auth.cluster_ca_certificate`
Service Token
`kubectl -n kube-system get secrets -o json | jq -r '.items[] | select(.metadata.name | startswith("gitlab-admin")) | .data.token' | base64 --decode`

ВНИМАНИЕ ПРОБЛЕМА БЕЗОПАСНОСТИ
Проблема при создании неймспейса, необходим безопасный фикс
kubectl create clusterrolebinding serviceaccounts-cluster-admin \
    --clusterrole=cluster-admin \
    --group=system:serviceaccounts

