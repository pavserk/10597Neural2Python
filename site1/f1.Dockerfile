FROM continuumio/miniconda3:master-alpine AS dependencies
RUN python --version
RUN pip --version
ADD requirements.txt /requirements.txt
RUN pip install --no-cache-dir --upgrade -r requirements.txt

FROM dependencies AS build
COPY . /app
WORKDIR /app
ENV PORT 8080

CMD streamlit run app.py --server.address 0.0.0.0 --server.port $PORT --server.headless true --server.enableXsrfProtection false --server.enableCORS false --server.enableWebsocketCompression false --browser.serverAddress "https://*.containers.yandexcloud.net"


# docker pull tensorflow/tensorflow:latest

# docker build --progress=plain -t neural2-v8 -f f1.Dockerfile .
# docker run -e PORT=8080  -p 8080:8080 --name neural2c-v8 -d neural2-v8


# docker login --username oauth --password secret cr.yandex
# docker image tag neural2-v8 cr.yandex/crpbtkqol2ing4gt1s4p/neural2-site1:v8
# docker push cr.yandex/crpbtkqol2ing4gt1s4p/neural2-site1:v8







