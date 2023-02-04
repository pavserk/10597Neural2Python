FROM tensorflow/tensorflow:latest AS dependencies
RUN python --version
RUN pip --version
ADD requirements.txt /requirements.txt
RUN pip install -r requirements.txt

FROM dependencies AS build
COPY . /app
WORKDIR /app
RUN  "./setup.sh"
CMD streamlit run app.py --server.port $PORT --server.address 0.0.0.0


# docker pull tensorflow/tensorflow:latest
# docker build --progress=plain -t neural2-v855 -f f1.Dockerfile .
# docker run --name neural2-c1-v1n1211 -p 8501:8501 -d neural2-v11211
# docker run -e PORT=8080  -p 8080:8080 --name eural2-c1-v855 -d neural2-v855


# docker login --username oauth --password secret cr.yandex
# docker image tag neural2-v855 cr.yandex/crpbtkqol2ing4gt1s4p/neural22:v7
# docker push cr.yandex/crpbtkqol2ing4gt1s4p/neural22:v7







