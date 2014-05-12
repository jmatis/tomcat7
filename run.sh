#!/bin/sh
name=$(basename $(pwd))
did=$(docker run -d --net=host -p 8080:8080 -P jmatis/${name} )
echo $did
docker logs -f ${did}
