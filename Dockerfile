FROM jmatis/java
MAINTAINER jan.matis@gmail.com

# install tomcat
WORKDIR /opt
RUN wget -nv http://mirrors.ukfast.co.uk/sites/ftp.apache.org/tomcat/tomcat-7/v7.0.53/bin/apache-tomcat-7.0.53.tar.gz -O - | tar -zxf-
# create symlink
RUN ln -s /opt/apache-tomcat-7.0.53/ /opt/tomcat

# grab supervisor config for tomcat
RUN wget -nv https://raw.githubusercontent.com/jmatis/tomcat7/master/supervisord-tomcat.conf -O /etc/supervisor/conf.d/tomcat.conf

# add start script
RUN wget -nv https://raw.githubusercontent.com/jmatis/tomcat7/master/tomcat-supervisor.sh -O tomcat-supervisor.sh
RUN chown root:root /opt/tomcat-supervisor.sh
RUN chmod 700 /opt/tomcat-supervisor.sh


# export tomcat's port
EXPOSE 8080

