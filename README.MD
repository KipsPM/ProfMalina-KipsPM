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

`helm3 upgrade --install gitlab .`

change domain 178-154-226-58.sslip.io

`helm3 upgrade --install gitlab .`
`kubectl get secret gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode ; echo`

gitlab-ci

add projects in gitlab

`git remote add origin git@gitlab.178-154-226-58.sslip.io:search_engine/ui.git`
`git remote add origin git@gitlab.178-154-226-58.sslip.io:search_engine/crawler.git`

add gitlab-runner `privileged: true`

alternative https://github.com/GoogleContainerTools/kaniko

`helm3 upgrade --install gitlab .`

add .gitlab-ci.yml

see
gitlab.178-154-226-58.sslip.io user:root password:otusgitlab

add `CI_REGISTRY_USER CI_REGISTRY_PASSWORD`
