package com.kineticdata;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.exceptions.NoHostAvailableException;
import com.datastax.driver.core.policies.DefaultRetryPolicy;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class Main {
    public static void main(String[] args) {
        // Open up a socket that other containers can monitor to tell if configuration is happening.
        // Once the socket closes, the other containers know they can resume execution.
        ServerSocket socket;
        try { socket = new ServerSocket(8181); } catch (Exception e) { throw new RuntimeException(e); }

        // Initialize the Cassandra cluster builder
        Cluster.Builder builder = Cluster.builder()
            .addContactPoint("cassandra")
            .withRetryPolicy(DefaultRetryPolicy.INSTANCE);

//        // If authentication is required
//        if (username != null && !"".equals(username)) {
//            builder.withCredentials(username, password);
//        }
//        // If SSL is required
//        if (sslOptions != null) {
//            builder.withSSL(sslOptions);
//        }

        // Prepare the session
        Session session = null;
        // Keeps a record of the amount of cassandra connection attempts (with a 5 second wait
        // between attempts). Currently set to a 12 attempt max which leads to a total timeout
        // around 1 minute.
        int attempts = 0;
        int maxAttempts = 12;
        while (session == null) {
            attempts += 1;
            try {
                // Build the cluster
                Cluster cluster = builder.build();
                session = cluster.connect();
            } catch (NoHostAvailableException nhe) {
                if (attempts == maxAttempts) {
                    // Throw an error if the max attempts have been attempted
                    throw new RuntimeException("Failure to connect to Cassandra server after timeout exceeded",nhe);
                } else {
                    // Sleep for 5 seconds and try again
                    System.out.println(String.format("Failed to connect to Cassandra server. Trying %s more times.",maxAttempts-attempts));
                    try { TimeUnit.SECONDS.sleep(5); } catch (Exception e) {throw new RuntimeException(e);}
                }
            }
        }

        // Create and prepare the Bridgehub keyspace
        executeFromCqlLocation(session, "bridgehub-init.cql");

        // Create and prepare the Filehub keyspace
        executeFromCqlLocation(session, "filehub-init.cql");

        // Create and prepare the Kinetic Core keyspace
        executeFromCqlLocation(session, "request-ce-create-keyspace.cql");
        executeFromCqlLocation(session, "schema.cql");

        try { socket.close(); } catch (Exception e) { throw new RuntimeException(e); }
        System.exit(0);
    }

    public static void executeFromCqlLocation(Session session, String cqlLocation) {
        List<String> statements = dbFileStatementSplit(cqlLocation);

        for (String statement : statements) {
            System.out.println("Executing statement: " + statement);
            try {
                session.execute(statement);
            } catch (Exception e) {
                throw new RuntimeException("Error executing CQL Statement",e);
            }
        }
    }

    public static List<String> dbFileStatementSplit(String fileLocation) {
        // Load the sql from the file
        System.out.println("Attempting to read file "+fileLocation+" from the jar");
        InputStream in = Main.class.getResourceAsStream("/"+fileLocation);
        if (in == null) throw new RuntimeException("Error retrieving DB File from the provided filename");
        BufferedReader reader = new BufferedReader(new InputStreamReader(in));
        String sql = reader.lines().collect(Collectors.joining("\n"));

        // Split the cql into a list of individual statements
        List<String> statements = new ArrayList<String>();
        for (String statement : sql.split(";")) {
            statements.add(statement.trim());
        }

        return statements;
    }
}