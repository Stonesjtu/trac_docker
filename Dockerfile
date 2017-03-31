FROM ubuntu:16.04

LABEL maintainer "skyisno.1@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y pwgen \
    git-core \
    trac \
    trac-* \
    python-flup && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY setup_trac_config.sh /.setup_trac_config.sh
COPY setup_trac.sh /.setup_trac.sh
COPY run.sh /run.sh
COPY trac_logo.png /var/www/trac_logo.png

COPY set_trac_user_password.py /usr/local/bin/
RUN chmod 755 /usr/local/bin/set_trac_user_password.py


EXPOSE 80
CMD ["/run.sh"]
