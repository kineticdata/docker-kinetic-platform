CREATE KEYSPACE IF NOT EXISTS kinetic_filehub WITH REPLICATION = { 'class': 'SimpleStrategy', 'replication_factor': 1 };

use kinetic_filehub;

CREATE TABLE IF NOT EXISTS cluster_events (
    action text,
    bucket text,
    content text,
    id timeuuid,
    source_node_key text,
    PRIMARY KEY ((bucket), id)
)
WITH CLUSTERING ORDER BY (id ASC)
 AND COMPACTION={
    'sstable_size_in_mb': '256',
    'tombstone_threshold': '0.05',
    'unchecked_tombstone_compaction': 'true',
    'tombstone_compaction_interval': '3600',
    'class': 'LeveledCompactionStrategy'
};

CREATE TABLE IF NOT EXISTS cluster_configuration_items (
    bucket text,
    content text,
    key text,
    PRIMARY KEY ((bucket), key)
)
WITH CLUSTERING ORDER BY (key ASC)
 AND COMPACTION={
    'sstable_size_in_mb': '256',
    'tombstone_threshold': '0.05',
    'unchecked_tombstone_compaction': 'true',
    'tombstone_compaction_interval': '3600',
    'class': 'LeveledCompactionStrategy'
};