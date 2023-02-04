FROM continuumio/miniconda3:master-alpine AS dependencies
RUN python --version
RUN pip --version
ADD requirements.txt /requirements.txt
RUN pip install --no-cache-dir --upgrade -r requirements.txt

FROM dependencies AS build
COPY . /app
WORKDIR /app
ENV PORT 8080

CMD uvicorn app:app --host 0.0.0.0 --port $PORT

# docker pull continuumio/miniconda3:master-alpine

# docker build --progress=plain -t neural2-f8 -f f1.Dockerfile .
# docker run -e PORT=8000 -p 8000:8000 --name neural2c-f8 -d neural2-f8

# docker login --username oauth --password secret cr.yandex
# docker image tag neural2-f8 cr.yandex/crpbtkqol2ing4gt1s4p/neural2-site2:v1
# docker push cr.yandex/crpbtkqol2ing4gt1s4p/neural2-site2:v1







