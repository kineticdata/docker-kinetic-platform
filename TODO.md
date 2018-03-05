* Automate cassandra configuration for the different applications (bridgehub, filehub, request-ce)
  * For each:
    * Create keyspace
    * Run initial schema creator script

* Configure other containers (request, bridgehub, filehub) to properly wait for Cassandra to finish complete configuration/boot-up rather relying on an arbitrary wait time
  * Scripts that does something like checking for open ports, attempting to access data, etc.
  * Should also do the same for task/postgres

* Separate configuration files and data files for the applications (allows for easily deleting all data to have a clean environment without losing configuration)
  * Needs to happen after automating cassandra configuration because currently the data contains a baseline manually configured application

* Allow configuration of open nginx port through an environment variable

* Automate the retrieval of the .war files to ensure we are getting the most up to date version of them