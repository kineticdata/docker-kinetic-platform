# Cassandra

This image is provided because some changes were made to the default cassandra configuration file.

## Changes

The following changes were made to cassandra.yaml:

| Property Name                       | Default Value | Updated Value |
| ----------------------------------- | ------------: | ------------: |
| batch_size_fail_threshold_in_kb     |          _50_ |     _**500**_ |
| memtable_offheap_space_in_mb        |        _2048_ |      _**32**_ |
| commitlog_sync_period_in_ms         |       _10000_ |    _**3000**_ |
| concurrent_reads                    |          _32_ |      _**16**_ |
| concurrent_writes                   |          _32_ |      _**16**_ |
| concurrent_counter_writes           |          _32_ |      _**16**_ |
| write_request_timeout_in_ms         |        _2000_ |    _**6000**_ |
| counter_write_request_timeout_in_ms |        _5000_ |   _**11000**_ |
