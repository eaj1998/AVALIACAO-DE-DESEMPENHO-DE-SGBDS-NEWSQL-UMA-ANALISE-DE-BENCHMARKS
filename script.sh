#!/bin/bash

# Variables
BENCHBASE_HOME="/benchbase"  # BenchBase is already in the container
CONFIG_FILE="/benchbase/config/yugabyte_config.xml"  # Update this to your config file path in the container
POSTGRES_HOST="yugabytedb"  # Use the service name from Docker Compose
POSTGRES_PORT="5433"        # YugabyteDB PostgreSQL API port
POSTGRES_USER="yugabyte"    # Default YugabyteDB user
POSTGRES_PASSWORD="yugabyte"  # Default YugabyteDB password
POSTGRES_DB="yugabyte"      # Default YugabyteDB database
YCSB_WORKLOAD="/benchbase/workloads/workload.txt"  # Path to your YCSB workload file in the container

# Export environment variables for PostgreSQL
export PGHOST=$POSTGRES_HOST
export PGPORT=$POSTGRES_PORT
export PGUSER=$POSTGRES_USER
export PGPASSWORD=$POSTGRES_PASSWORD
export PGDATABASE=$POSTGRES_DB

echo "BEFORE RUNNING I'M HERE"

# Run BenchBase with YCSB and the provided configuration
java -jar $BENCHBASE_HOME/benchbase.jar \
    -b ycsb \
    -c $CONFIG_FILE \
    --execute \
    --create=true \
    --load=true \
    --workload $YCSB_WORKLOAD

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "BenchBase run completed successfully."
else
    echo "BenchBase run failed."
fi