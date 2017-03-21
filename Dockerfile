FROM sivapraveen/ruby23-mysql-redis-nodejs:v1

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
    && unset GEM_HOME \
    && \curl -sSL https://get.rvm.io | bash -s stable --ruby \
    && /bin/bash -l -c "source /usr/local/rvm/scripts/rvm"

RUN /bin/bash -l -c "rvm install 2.1" \
    && /bin/bash -l -c "rvm install 2.2" \ 
    && /bin/bash -l -c "rvm install 2.3.0" \ 
    && /bin/bash -l -c "rvm install 2.3.1" \
    && /bin/bash -l -c "rvm install 2.3.2" \
    && /bin/bash -l -c "rvm install 2.3.3" \
    && /bin/bash -l -c "rvm install 2.4.0" \
    && /bin/bash -l -c "rvm --default 2.4.0" \
    && /bin/bash -l -c "rvm list"

MAINTAINER NoSkillGuy <rsivapraveen001@gmail.com>
