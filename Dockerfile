FROM ubuntu:14.04

COPY install.sh /install.sh

RUN sudo apt-get update
RUN sudo apt-get install -y curl \
    python-pip make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
    python-dev python-setuptools python-pip \
	git mercurial subversion \
	mysql-common mysql-client redis-server \
	gettext libffi-dev npm ruby-dev \
	libtiff4-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk

RUN /bin/bash /install.sh && rm /install.sh

ENV HOME /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

WORKDIR /src
CMD ["tox"]
