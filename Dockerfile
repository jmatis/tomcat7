FROM jmatis/java
MAINTAINER jan.matis@gmail.com

# adding java, tomcat
WORKDIR /opt
RUN wget http://mirrors.ukfast.co.uk/sites/ftp.apache.org/tomcat/tomcat-7/v7.0.53/bin/apache-tomcat-7.0.53.tar.gz
RUN gunzip apache-tomcat-7.0.53.tar.gz
RUN tar xf apache-tomcat-7.0.53.tar
RUN rm -f apache-tomcat-7.0.53.tar

# creating symlinks - these are user in start script so necesary for correct functioning
RUN ln -s /opt/apache-tomcat-7.0.53/ /opt/tomcat

# adding start script
ADD start-watch-tomcat.sh /opt/start-watch-tomcat.sh
RUN chown root:root /opt/start-watch-tomcat.sh
RUN chmod 700 /opt/start-watch-tomcat.sh

# export tomcats port
EXPOSE 8080

# let's get tomcat on (script will stay on as long as tomcat is running )
CMD /opt/start-watch-tomcat.sh
