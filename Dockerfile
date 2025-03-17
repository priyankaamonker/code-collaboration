FROM node:16
ENV NODE_VERSION=16.13.0
RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version
WORKDIR /usr/src/app
COPY . .
RUN npm install express@4 socket.io sqlite3
# ARG PORT1=3001
# ARG PORT2=3002
# RUN echo "hello world" $PORT1 $PORT2
# EXPOSE $PORT1 $PORT2
CMD [ "node", "index.js" ]
##################

# docker build -t codemirrorapp .
# docker run -d -p 1234:1234 -p 5678:5678 --name=container_codemirrorapp codemirrorapp 
# docker exec -it container_codemirrorapp bash


# docker build --build-arg PORT1=3434 --build-arg PORT2=5656 -t codemirrorapp .
# docker run -d -p 3434:3434 -p 5656:5656 --name=container_codemirrorapp codemirrorapp 
# docker exec -it container_codemirrorapp bash

# docker build -t codemirrorapp .
# docker images
# docker run -d -p 8090:8090 --network=bridge --name=container_codemirrorapp codemirrorapp 
# docker exec -it container_codemirrorapp bash

# More documentation 
# docker rmi codemirrorapp (to remove docker image)
# docker ps -a (list all containers)
# docker stop container_codemirrorapp (stop container)

# $ docker images                     // To view install images
# $ docker rmi <IMAGE_NAME>           // To remove an installed image

# $ docker ps -a                      // To view all docker containers
# $ docker stop <CONTAINER_NAME>      // To stop a docker container
# $ docker rm <CONTAINER_NAME>        // To remove a docker container

# $ docker exec -it <CONTAINER_NAME> bash    // Execute into container and run bash

# * If you want to see the log output from a docker container, omit the -d from run.sh
# docker logs --since=1h <container_id>