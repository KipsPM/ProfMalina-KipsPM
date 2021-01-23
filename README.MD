#Pre-requisites:
1. terraform 0.13.6
2. Yandex CLI

#Install guide
1. Install Kubernetes cluster on YandexCloud
  - cd otus_kursach/terraform/prod
  - terraform init
  - terraform apply -auto-approve
  - yc managed-kubernetes cluster get-credentials otus-cluster --external

2. Install GitLab
3. Configure GitLab&Kubernetes
4. Install Crawler stack
5. Install Prometheus&Grafana
6. Install EFK stack
7. 

add Dockerfile

add docker-compose.yml

use terraform 0.13.6

kluster up

`terraform init`
`terraform apply -auto-approve`
`yc managed-kubernetes cluster get-credentials otus-cluster --external`

install gitlab

use helm3.5
# ВНИМАНИЕ версия 3.0 отрабатывает не корректно

`helm3 repo add gitlab https://charts.gitlab.io`
`helm3 fetch gitlab/gitlab --untar`
`cd gitlab`

change certmanager-issuer
change domain my-random-name.xyz
========
add gitlab-runner `privileged: true`
alternative https://github.com/GoogleContainerTools/kaniko
========
`helm3 upgrade --install gitlab .`

`kubectl get secret gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode ; echo`

gitlab-ci

add projects in gitlab

`git remote add origin git@gitlab.my-random-name.xyz:search_engine/ui.git`
`git remote add origin git@gitlab.my-random-name.xyz:search_engine/crawler.git`

`helm3 upgrade --install gitlab .`

add .gitlab-ci.yml

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

add `CI_REGISTRY_USER CI_REGISTRY_PASSWORD KUBE_TOKEN KUBE_URL`

После заливки проектов добавить `SEARCH_ENGINE_DEPLOY_TRIGGER_TOKEN`

helm add repo stable https://charts.helm.sh/stable
helm fetch stable/rabbiit
Затем настройка параметров

Добавление аутентификации

sudo apt install apache2-utils
htpasswd -c data.auth foo
pwd: bar
kubectl create secret generic basic-auth --from-file=auth
kubectl get secret basic-auth -o yaml

    nginx.ingress.kubernetes.io/auth-type: basic
    # name of the secret that contains the user/password definitions
    nginx.ingress.kubernetes.io/auth-secret: basic-auth
    # message to display with an appropriate context why the authentication is required
    nginx.ingress.kubernetes.io/auth-realm: 'Authentication Required - foo'

добавить файл секрет в тэмплэйт

helm fetch stable/prometheus —-untar 
helm fetch stable/grafana --untar

kubectl get svc
ip prometheus-server
dashboard 741 315
Необходимо добавить метрики для сервисов

EFK

helm repo add gitlab  https://charts.gitlab.io 
helm fetch gitlab/elastic-stack --untar
запрос для логов kubernetes.pod.name *staging-ui* and stream *stdout*
