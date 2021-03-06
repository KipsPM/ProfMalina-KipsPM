================================
docker exec -i -t <id_cont> sh
================================
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /tmp/tls.key -out /tmp/tls.crt -subj "/CN=gitlab-gitlab"
kubectl create secret tls gitlab-tls --key /tmp/tls.key --cert /tmp/tls.crt
================================
helm upgrade --install \
      --wait \
      --set ui.ingress.host="$host" \
      --set $CI_PROJECT_NAME.image.tag=$CI_APPLICATION_TAG \
      --namespace="$KUBE_NAMESPACE" \
      --version="$CI_PIPELINE_ID-$CI_JOB_ID" \
      "$name" \
      reddit-deploy/reddit/
===================================
helm3 upgrade --install \
      --wait \
      --namespace="test" \
      --version="1.0.0" \
      "test" \
      .
===================================
An example Ingress that makes use of the controller:

  apiVersion: networking.k8s.io/v1beta1
  kind: Ingress
  metadata:
    annotations:
      kubernetes.io/ingress.class: {{ .Values.controller.ingressClass }}
    name: example
    namespace: foo
  spec:
    rules:
      - host: www.example.com
        http:
          paths:
            - backend:
                serviceName: exampleService
                servicePort: 80
              path: /
    # This section is only required if TLS is to be enabled for the Ingress
    tls:
        - hosts:
            - www.example.com
          secretName: example-tls
====================================
    - kubectl config set-cluster otus-cluster --server="$KUBE_URL" --insecure-skip-tls-verify=true
    - kubectl config set-credentials admin --token="$KUBE_TOKEN"
    - kubectl config set-context default --cluster=otus-cluster --user=admin
    - kubectl config use-context default
====================
helm upgrade --install --wait --debug --set ui.ingress.host="staging.my-random-name.xyz" --set ui.image.tag="latest" --set --namespace="staging" --version="23-54" testing search_engine/

helm upgrade --install --set ui.ingress.host="staging.130-193-38-169.sslip.io" --set ui.image.tag="latest" --set crawler.image.tag="latest" --namespace="staging" --version="12-22" test search_engine