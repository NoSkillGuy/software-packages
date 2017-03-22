FROM sivapraveen/ruby23-mysql-redis-nodejs:v1

ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

#  RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 
#      && unset GEM_HOME \
#      && \curl -sSL https://get.rvm.io | bash -s stable --ruby \
#      && /bin/bash -l -c "source /usr/local/rvm/scripts/rvm"


#  RUN /bin/bash -l -c "rvm install 2.1" \
#       && /bin/bash -l -c "rvm install 2.2" \ 
#       && /bin/bash -l -c "rvm install 2.3.0" \ 
#       && /bin/bash -l -c "rvm install 2.3.1" \
#       && /bin/bash -l -c "rvm install 2.3.2" \
#       && /bin/bash -l -c "rvm install 2.3.3" \
#       && /bin/bash -l -c "rvm install 2.4.0" \
#       && /bin/bash -l -c "rvm --default 2.4.0" \
#       && /bin/bash -l -c "rvm list"

MAINTAINER NoSkillGuy <rsivapraveen001@gmail.com>


#Install rvm 
RUN apt-get update -qq 
RUN apt-get install -y --no-install-recommends ca-certificates wget 
RUN wget -O /usr/local/bin/rvm-installer "https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer"  
RUN wget -O /usr/local/bin/rvm-installer.asc "https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer.asc" 
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 
RUN gpg --batch --verify /usr/local/bin/rvm-installer.asc /usr/local/bin/rvm-installer  
RUN rm -r /usr/local/bin/rvm-installer.asc 
RUN chmod +x /usr/local/bin/rvm-installer  
RUN /bin/bash rvm-installer stable  
RUN . /etc/profile.d/rvm.sh 
RUN rvm requirements 
RUN rvm install ruby-2.3 
RUN rvm install 2.1 
RUN rvm install 2.2  
RUN rvm install 2.3.0  
RUN rvm install 2.3.1 
RUN rvm install 2.3.2 
RUN rvm install 2.3.3 
RUN rvm install 2.4.0 
RUN rvm list 
RUN echo "source /usr/local/rvm/scripts/rvm" >> /etc/profile 
RUN echo "rvm use ruby-2.4.0 --default" >> /etc/profile 

CMD [/bin/bash", "-l"]