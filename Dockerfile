FROM postgres:13-alpine

# copy initialization into the image
RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./init /docker-entrypoint-initdb.d