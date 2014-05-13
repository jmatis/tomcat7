#!/bin/sh
docker_id=$(docker run -d --net=host -p 8080:8080 -P jmatis/tomcat7 )
echo $docker_id
docker logs -f ${docker_id}
