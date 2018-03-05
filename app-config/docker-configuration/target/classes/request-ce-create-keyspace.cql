CREATE KEYSPACE IF NOT EXISTS kinetic_core WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

use kinetic_core;