# docker-kinetic-platform

Run the entire Kinetic Data platform in Docker.

## Docker Host

Ensure your docker host is configured with at least 4GB of memory, and at least 4 CPUs.

1.  Open Docker preferences
2.  Click on the Advanced tab
3.  Adjust settings and save changes

## Running

Command to run: `docker-compose up` or `docker-compose up -d` to run in detached mode. See the [docker-compose up](https://docs.docker.com/compose/reference/up/) reference page for additional information.

Access applications on localhost:8080

* http://localhost:8080/kinetic
* http://localhost:8080/kinetic-task
* http://localhost:8080/kinetic-filehub
* http://localhost:8080/kinetic-bridgehub
