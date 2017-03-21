FROM sivapraveen/ruby23-mysql-redis-nodejs:v1

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
    curl -sSL https://get.rvm.io | bash -s stable --ruby && \
    rvm install 2.3.0 && \
    rvm install 2.3.1 && \
    rvm install 2.3.2 && \
    rvm install 2.3.3 && \
    rvm install 2.4.0

MAINTAINER NoSkillGuy <rsivapraveen001@gmail.com>
