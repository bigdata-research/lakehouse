#!/bin/sh
# HIVE_HOME=/usr/local/hive-metastore/bin/schematool

# /usr/local/hive-metastore/bin/schematool -initSchema -dbType postgres
/usr/local/hive-metastore/bin/schematool -dbType postgres -validate

if [ $? -eq 0 ]; then
    echo "Metadata found, skipping schema initialization..."
    
else
    echo "Metadata data not found, initializing schema..."
    /usr/local/hive-metastore/bin/schematool -dbType postgres -initSchema --verbose
    /usr/local/hive-metastore/bin/schematool -dbType postgres -info
fi

/usr/local/hive-metastore/bin/start-metastore --verbose