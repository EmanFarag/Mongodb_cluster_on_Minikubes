#!/bin/sh
##

kubectl exec -it mongod-0 -c mongod-container bash
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'rs.slaveOk();'
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'db.getSiblingDB("admin").auth("main_admin", "admin");'
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'use test;'
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'db.testcoll.insert({name:John});'
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'db.testcoll.insert({name:Emma});'
kubectl exec mongod-0 -c mongod-container -- mongo --eval 'db.testcoll.find();'

