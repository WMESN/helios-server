FROM python:3.6

WORKDIR /helios-server
COPY . /helios-server/

RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    libldap2-dev \
    libsasl2-dev \
    ldap-utils \
    tox \
    lcov \
    libmemcached-dev \
    valgrind \
    && rm -rf /var/lib/apt/lists/*

# Default configuration: can be overridden at the docker command line

RUN  pip3 install --no-cache-dir -U -r /helios-server/requirements.txt


EXPOSE 8000
#EXPOSE 8000/tcp

#CMD ["python3", "./manage.py", "runserver", "0.0.0.0:8000"]

#CMD ["python3", "helios-server//manage.py runserver 0.0.0.0:8000"]
