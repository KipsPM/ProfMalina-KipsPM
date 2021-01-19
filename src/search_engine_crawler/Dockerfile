FROM python:3.6.0-alpine

WORKDIR /app
ADD . /app

RUN pip install --no-cache-dir -r /app/requirements.txt

ENV MONGO=mongodb
ENV MONGO_PORT=27017
ENV RMQ_HOST=rabbitmq
ENV RMQ_QUEUE=mqqueue
ENV RMQ_USERNAME=test
ENV RMQ_PASSWORD=test
ENV CHECK_INTERVAL=10
ENV EXCLUDE_URLS=".*github.com"
ENV PYTHONUNBUFFERED 1
# ENV URL="https://vitkhab.github.io/search_engine_test_site/"

CMD ["/bin/bash"]
ENTRYPOINT EXCLUDE_URLS=".*github.com" python crawler/crawler.py https://vitkhab.github.io/search_engine_test_site/
