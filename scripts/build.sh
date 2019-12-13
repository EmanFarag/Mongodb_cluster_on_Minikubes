#!/bin/sh
##
# Script to deploy a Kubernetes with a StatefulSet running a MongoDB Replica Set, to a local Minikube environment.
##
echo "Keep running the following command until all 'mongod-n' pods are shown as running:  kubectl get all"

# Create keyfile for the MongoD cluster as a Kubernetes shared secret
TMPFILE=$(mktemp)
/usr/bin/openssl rand -base64 741 > $TMPFILE
kubectl create secret generic shared-bootstrap-data --from-file=internal-auth-mongodb-keyfile=$TMPFILE
rm $TMPFILE

# Create mongodb service with mongod stateful-set
kubectl apply -f ../resources/mongodb-service.yaml --validate=true


# Print current deployment state
kubectl get all
kubectl get persistentvolumes
echo "Keep running the following command until all 'mongod-n' pods are shown as running:  kubectl get all"
sleep 20
kubectl get all