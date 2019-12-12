#!/usr/bin/env bash

set -e
echo -e "Setting up Minikube cluster."
case "not found" in
    *"$(minikube --help)"*)
        echo -e "Error: minikube is not installed! Go to https://github.com/kubernetes/minikube and install the latest version." >&2
        exit 1
        ;;
esac
case "not found" in
    *"$(docker-machine create --driver virtualbox --help)"*)
        echo -e "Error: Virtualbox is not installed! Go to https://virtualbox.org and install the latest version." >&2
        exit 1
        ;;
esac
echo -e "Building Jenkins image."
docker-compose down
docker-compose up -d

echo -e "\t1. Starting Kubernetes cluster."
minikube start

echo -e "\n\t2. Evaling the minikube VM docker environment variables."
eval "$(minikube docker-env)"


echo -e "\t3. Checking All pods and containers are running."
kubectl get nodes
kubectl describe nodes
kubectl get services
kubectl get all

echo -e "\n\t4. Starting kubernetes dashboard."
minikube dashboard
