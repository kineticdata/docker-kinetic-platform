# docker-kinetic-platform

Run the entire Kinetic Data platform in Docker.

## Docker Host

Ensure your docker host is configured with at least 4GB of memory, and at least 4 CPUs.

1.  Open Docker preferences
2.  Click on the Advanced tab
3.  Adjust settings and save changes

## Running

Command to run: `docker-compose up` or `docker-compose up -d` to run in detached mode. See the [docker-compose up](https://docs.docker.com/compose/reference/up/) reference page for additional information.

Access applications on the host server. Assuming this is running on your local machine using the default host port, the paths would be the following:

* http://localhost:8080/kinetic
* http://localhost:8080/kinetic-task
* http://localhost:8080/kinetic-filehub
* http://localhost:8080/kinetic-bridgehub

The host port can be modified in the nginx service by changing the HOST_PORT environment variable to an open port on the host machine. If you change this value, you must also update the port mapping immediately below this environment variable as well.

Assuming you change the HOST_PORT environment variable and port mapping to 8888 because you already have a service running on the same host using port 8080, the updated paths would be:

* http://localhost:8888/kinetic
* http://localhost:8888/kinetic-task
* http://localhost:8888/kinetic-filehub
* http://localhost:8888/kinetic-bridgehub
