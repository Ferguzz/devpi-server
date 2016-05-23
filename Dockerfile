FROM ubuntu

RUN apt-get update && apt-get install -y \
    curl \
    nginx \
    python \
    supervisor

RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py

RUN pip install \
    devpi-server

COPY supervisor-devpi.conf /etc/supervisor/conf.d/
COPY nginx-devpi.conf /etc/nginx/sites-available/

RUN rm /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx/sites-available/nginx-devpi.conf /etc/nginx/sites-enabled/nginx-devpi.conf

EXPOSE 80

COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]