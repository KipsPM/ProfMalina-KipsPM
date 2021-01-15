================================
docker exec -i -t <id_cont> sh
================================
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /tmp/tls.key -out /tmp/tls.crt -subj "/CN=gitlab-gitlab"
kubectl create secret tls gitlab-tls --key /tmp/tls.key --cert /tmp/tls.crt
================================
