# docker-kinetic-platform

Run the entire Kinetic Data platform in Docker.

## Docker Host

Ensure your docker host is configured with at least 4GB of memory, and at least 4 CPUs.

1.  Open Docker preferences
2.  Click on the Advanced tab
3.  Adjust settings and save changes

The more memory and CPUs you can give to Docker, the better performance you will get from the platform. If you are able to increase the amount of memory allocated to Docker, remember to increase the MAX_HEAP_SIZE environment variable for the cassandra service defined in the docker-compose.yml file, and possibly the -Xmx option of the JAVA_OPTS environment variable for the request-ce service.

## Running

Command to run: `docker-compose up` or `docker-compose up -d` to run in detached mode. If you have pulled updates to this repository from Github, it may be necessary to rebuild the images so the changes are applied. You can do this by adding the `--build` flag; `docker-compose up --build` or `docker-compose up -d --build`.

See the [docker-compose up](https://docs.docker.com/compose/reference/up/) reference page for additional information.

The first time docker-compose is run will take a significant amount of time.  All of the images needs to be built on your system, both the Cassandra and PostgreSQL databases need to be created, and all the foundation data needs to be populated in the system.  This can take 5 - 10 minutes depending on the resources available to the docker engine.  Subsequent starts will be much faster as these steps will be skipped.

Access applications on the host server. Assuming this is running on your local machine using the default host port, the paths would be the following:

* <http://localhost:8080/kinetic>
* <http://localhost:8080/kinetic-task>
* <http://localhost:8080/kinetic-filehub>
* <http://localhost:8080/kinetic-bridgehub>

The host port can be modified in the nginx service by changing the HOST_PORT environment variable to an open port on the host machine. This property can be found in the accompanying `.env` file.

Assuming you change the HOST_PORT environment variable and port mapping to 8888 because you already have a service running on the same host using port 8080, the updated paths would be:

* <http://localhost:8888/kinetic>
* <http://localhost:8888/kinetic-task>
* <http://localhost:8888/kinetic-filehub>
* <http://localhost:8888/kinetic-bridgehub>

### Ready

The platform is ready to use when you see the following message in your terminal:

```bash
space-setup_1     | ---------------------------------------------------------------------
space-setup_1     | 	The "Playground" space is ready at http://localhost:8080
space-setup_1     | ---------------------------------------------------------------------
space-setup_1     | 
docker-kinetic-platform_space-setup_1 exited with code 0
```

Open your web browser to <http://localhost:8080> to get started.

### Warning

The HOST_PORT is used in configuration values to link Request CE with Bridgehub, Filehub, and Task.  If you change this value after the initial run, you will need to update some configuration values with the new HOST_PORT value.

## Persisting Data

By default, all runtime data created by the various applications are persisted to the `data` directory within this repository location. This location may be changed by updating the volume paths in the `docker-compose.yml` file.

Some examples of runtime data are:

* web application configuration files
* database files
* log files

## Application Credentials

Default credentials are used to initialize the applications, but these should be changed if you intend to use the platform for anything other than just kicking the tires.

Also, the initial username / password used for the Request CE - Space Admin user are defined in the docker-compose file. You can change these values from the defaults shown below, but you should still change this password after the initial login as the password value is stored in plain text within the docker-compose file.

### Default Values

| Application              | Username | Password |
| ------------------------ | -------- | -------- |
| Request CE - Admin       | admin    | admin    |
| Request CE - Space Admin | kdadmin  | admin    |
| Task                     | admin    | admin    |
| Bridgehub                | admin    | admin    |
| Filehub                  | admin    | admin    |
