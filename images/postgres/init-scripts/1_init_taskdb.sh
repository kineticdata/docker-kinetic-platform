#!/usr/bin/env bash
psql -f /docker-entrypoint-initdb.d/init-task.sql.noautorun -U kinetictask_user -d TASK_DATABASE -h localhost