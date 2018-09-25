# docker-kinetic-platform

Run the entire Kinetic Data platform in Docker.

## Docker Host

Ensure your docker host is configured with at least 4GB of memory, and at least 4 CPUs.

1.  Open Docker preferences
2.  Click on the Advanced tab
3.  Adjust settings and save changes

The more memory and CPUs you can give to Docker, the better performance you will get from the platform. If you are able to increase the amount of memory allocated to Docker, remember to increase the MAX_HEAP_SIZE environment variable for the cassandra service defined in the docker-compose.yml file, and possibly the -Xmx option of the JAVA_OPTS environment variable for the request-ce service.

## Docker for Windows

We do not at this time support using Windows containers on Docker for Windows. This will only successfully run when using Linux containers. If Windows containers are used instead error messages such as `chmod: Command not found` or other various `Command not found` error messages will occur.

After ensuring that your Docker for Windows installation is set to use Linux containers, you'll need to do the following next steps to get the Kinetic docker platform running:

1.  Rename docker-compose.yml to docker-compose-linux.yml
2.  Rename docker-compose-windows.yml to docker-compose.yml
3.  From a PowerShell prompt enter the following command: `docker volume create postgres_kinetic_task_db_platform`

These steps are necessary due to the Postgres application requiring it's data files be owned by the postgres user. This is not possible however when using Docker for Windows and storing the data files on the Windows file system. More information on this is available in this [Github Issue](https://github.com/docker/for-win/issues/445)

After following the steps above you should be to proceed to the 'Running' section below.

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

If you ran the `docker-compose up` command without using the detach flag (-d), you will continue to see logging information from each of the containers as long as your terminal is attached. You can safely detach from docker-compose by using the `CTRL+Z` key combination. You may see a message indicating `docker-compose up` was stopped, but your containers are actually still running.

```bash
^Z
[2]+  Stopped                 docker-compose up
```

If you ran the `docker-compose up` command without using the detach flag (-d), you can detach from docker-compose and stop the services by using the `CTRL+C` key combination.  This will not remove your containers, it will simply stop them from running.

### Warning

The HOST_PORT is used in configuration values to link Request CE with Bridgehub, Filehub, and Task.  If you change this value after the initial run, you will need to update some configuration values with the new HOST_PORT value.

## Persisting Data

By default, all runtime data created by the various applications are persisted to the `data` directory within this repository location. This location may be changed by updating the volume paths in the `docker-compose.yml` file.

Some examples of runtime data are:

* web application configuration files
* database files
* log files

If you're running Docker for Windows your database files are persisted to a mounted path within the Linux VM machine. These files will not show up in the data\postgres directory.

## Application Credentials

Default credentials are used to initialize the applications, but these should be changed if you intend to use the platform for anything other than just kicking the tires.

Also, the initial username / password used for the Request CE - Space Admin user are defined in the docker-compose file. You can change these values from the defaults shown below, but you should still change this password after the initial login as the password value is stored in plain text within the docker-compose file.

Kinetic Task is configured to authenticate against Request CE, so any users added to the Request CE space will be allowed to login to Kinetic Task.

### Default Values

| Application              | Username | Password |
| ------------------------ | -------- | -------- |
| Request CE - Admin       | admin    | admin    |
| Request CE - Space Admin | kdadmin  | admin    |
| Task - Admin             | admin    | admin    |
| Task - Space Use         | kdadmin  | admin    |
| Bridgehub                | admin    | admin    |
| Filehub                  | admin    | admin    |
