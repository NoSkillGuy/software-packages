FROM sivapraveen/ruby23-mysql-redis-nodejs:v1

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby 
RUN rvm install 2.3.0 
RUN rvm install 2.3.1 
RUN rvm install 2.3.2 
RUN rvm install 2.3.3 
RUN rvm install 2.4.0

MAINTAINER NoSkillGuy <rsivapraveen001@gmail.com>
