#!/bin/sh
docker run -i -p 8080:8080 -p 2022:22 -t jmatis/tomcat7 /bin/bash
