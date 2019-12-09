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

echo -e "\t1. Starting Kubernetes cluster."
minikube start
kubectl get nodes
kubectl describe nodes
kubectl get services


echo -e "\t2. Checking All pods and containers are running."
kubectl get all

echo -e "\n\t3. Starting kubernetes dashboard."
minikube dashboard
