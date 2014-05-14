#!/bin/bash
exitcode=1
myself=$0
function shutdown()
{
  export CATALINA_HOME=/opt/tomcat/
  export JAVA_HOME=/opt/java/
  cd /opt/tomcat/bin/
  ./shutdown.sh
  exitcode=0
}

trap shutdown HUP INT QUIT ABRT KILL ALRM TERM TSTP

export CATALINA_HOME=/opt/tomcat/
export JAVA_HOME=/opt/java/

cd /opt/tomcat/bin/
./startup.sh

sleep 60

processcount=$(ps -ef | grep -v grep | grep -v ${myself} | grep "org.apache.catalina.startup.Bootstrap start" | wc -l | awk '{print $1}')

while [ ${processcount} -eq 1 ]; do
        sleep 60
        processcount=$(ps -ef | grep -v grep | grep -v ${myself} | grep "org.apache.catalina.startup.Bootstrap start" | wc -l | awk '{print $1}')
done

exit ${exitcode}
