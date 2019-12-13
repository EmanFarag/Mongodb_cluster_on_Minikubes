#!/bin/sh
##
# Script to connect to the first instance and add some data.
##

# Connect to mongod-0
kubectl exec -it mongod-0 -c mongod-container bash

# Authenticate the connection
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'db.getSiblingDB("admin").auth("main_admin", "admin");'

# This allows the current connection to allow read operations to run on secondary members.
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'rs.slaveOk();'

# Switch to database test
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'use test;'

# Insert some data to database
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'db.testcoll.insert({name:John});'
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'db.testcoll.insert({name:Emma});'

# View the data inserted
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'db.testcoll.find();'

