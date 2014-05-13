FROM jmatis/java
MAINTAINER jan.matis@gmail.com

# adding java, tomcat
WORKDIR /opt
RUN wget -nv http://mirrors.ukfast.co.uk/sites/ftp.apache.org/tomcat/tomcat-7/v7.0.53/bin/apache-tomcat-7.0.53.tar.gz -O - | tar -zxf-

# creating symlinks - these are user in start script so necesary for correct functioning
RUN ln -s /opt/apache-tomcat-7.0.53/ /opt/tomcat

# adding start script
RUN wget -nv https://raw.githubusercontent.com/jmatis/tomcat7/master/start-watch-tomcat.sh -O start-watch-tomcat.sh
RUN chown root:root /opt/start-watch-tomcat.sh
RUN chmod 700 /opt/start-watch-tomcat.sh

# export tomcats port
EXPOSE 8080

# let's get tomcat on (script will stay on as long as tomcat is running )
CMD /opt/start-watch-tomcat.sh
