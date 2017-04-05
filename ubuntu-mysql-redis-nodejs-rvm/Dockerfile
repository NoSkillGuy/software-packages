FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get update && \
  apt-get install -y --no-install-recommends mysql-server tcl wget libgmp3-dev && \
  apt-get install --no-install-recommends -y -q curl python build-essential git ca-certificates && \
  apt-get clean

RUN { \
  echo '[mysqld]'; \
  echo 'character-set-server=utf8'; \
  echo 'collation-server=utf8_general_ci'; \
  echo '[client]'; \
  echo 'default-character-set=utf8'; \
} > /etc/mysql/conf.d/charset.cnf

ENV REDIS_VERSION 3.2.4 

RUN cd /tmp && \
  wget http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz && \
  tar xfvz redis-$REDIS_VERSION.tar.gz && \
  cd redis-$REDIS_VERSION && \
  make && \
  make install && \
  cd ../ && \
  rm -f redis-$REDIS_VERSION.tar.gz && \
  rm -rf redis-$REDIS_VERSION

RUN mkdir /nodejs && \
    curl http://nodejs.org/dist/v0.10.30/node-v0.10.30-linux-x64.tar.gz | tar xvzf - -C /nodejs --strip-components=1 

ENV PATH $PATH:/nodejs/bin

# install rvm 
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
  \curl -sSL https://get.rvm.io | bash -s stable

RUN /bin/bash -l -c 'source /etc/profile.d/rvm.sh'

# make bundler a default gem 
RUN echo bundler >> /usr/local/rvm/gemsets/global.gems

# setup some default flags from rvm (auto install, auto gemset create, quiet curl)
RUN echo "rvm_install_on_use_flag=1\nrvm_gemset_create_on_use_flag=1\nrvm_quiet_curl_flag=1" > ~/.rvmrc

# preinstall some ruby versions
ENV PREINSTALLED_RUBIES "2.4.0 2.3.3 2.3.1 2.3.0"
RUN /bin/bash -l -c 'for version in $PREINSTALLED_RUBIES; do echo "Now installing Ruby $version"; rvm install $version; rvm cleanup sources; done'

# source rvm in every shell
RUN sed -i '3i . /etc/profile.d/rvm.sh\n' ~/.profile

MAINTAINER Siva Praveen <rsivapraveen001@gmail.com>
