#!/bin/bash
# --

CASSANDRA_HOME="/var/lib/cassandra/data"
CASSANDRA_KEYSPACE="ContrailAnalyticsCql"
CASSANDRA_TABLES="tablename1 tablename2 tablename3 tablename4 tablename5 .... "

for TBL in $CASSANDRA_TABLES; do du -sh "$CASSANDRA_HOME/$CASSANDRA_KEYSPACE/$TBL" ; done

for TBL in $CASSANDRA_TABLES; do
  echo "Running major compaction for table $CASSANDRA_KEYSPACE.$TBL"
  nodetool compact $CASSANDRA_KEYSPACE $TBL
done

for TBL in $CASSANDRA_TABLES; do du -sh "$CASSANDRA_HOME/$CASSANDRA_KEYSPACE/$TBL" ; done

