#!/bin/bash

myself=$0

export CATALINA_HOME=/opt/tomcat/
export JAVA_HOME=/opt/java/

cd /opt/tomcat/bin/
./startup.sh
tail -f /opt/tomcat/logs/catalina.out &

sleep 60

processcount=$(ps -ef | grep -v grep | grep -v ${myself} | grep "org.apache.catalina.startup.Bootstrap start" | wc -l | awk '{print $1}')

while [ ${processcount} -eq 1 ]; do
        sleep 60
        processcount=$(ps -ef | grep -v grep | grep -v ${myself} | grep "org.apache.catalina.startup.Bootstrap start" | wc -l | awk '{print $1}')
done

echo "tomcat died" >&2
exit 1
