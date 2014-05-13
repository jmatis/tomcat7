FROM jmatis/java
MAINTAINER jan.matis@gmail.com

# install tomcat
WORKDIR /opt
RUN wget -nv http://mirrors.ukfast.co.uk/sites/ftp.apache.org/tomcat/tomcat-7/v7.0.53/bin/apache-tomcat-7.0.53.tar.gz -O - | tar -zxf-

# create symlink
RUN ln -s /opt/apache-tomcat-7.0.53/ /opt/tomcat

# add start script
RUN wget -nv https://raw.githubusercontent.com/jmatis/tomcat7/master/start-watch-tomcat.sh -O start-watch-tomcat.sh
RUN chown root:root /opt/start-watch-tomcat.sh
RUN chmod 700 /opt/start-watch-tomcat.sh

# export tomcat's port
EXPOSE 8080

# start tomcat
CMD /opt/start-watch-tomcat.sh
