#!/bin/sh
##
# Script to connect to the first instance and add some data.
##
# Check for database replica argument
if [[ $# -eq 0 ]] ; then
    echo 'You must provide one argument for the database replica'
    echo
    exit 1
fi


# Connect to mongod-0
kubectl exec -it mongod-"${1}" -c mongod-container bash

# Authenticate the connection
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'db.getSiblingDB('"'"'admin'"'"').auth("main_admin", "admin");'

# This allows the current connection to allow read operations to run on secondary members.
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'rs.slaveOk();'

# Switch to database test
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'use test;'

# View the data inserted
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'db.testcoll.find();'

