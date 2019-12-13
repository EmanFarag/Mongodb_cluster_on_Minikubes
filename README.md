# Automated provisioning of Mongodb cluster on Kubernetes

The project demonstrating the deployment of a MongoDB Replica Set via Kubernetes on Minikube (Kubernetes running locally on a workstation)


## 1 How To Run

### 1.1 Prerequisites

Ensure the following dependencies are already fulfilled on your host Linux/Windows/Mac Workstation/Laptop:

1. The [VirtualBox](https://www.virtualbox.org/wiki/Downloads) hypervisor has been installed.
2. The [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) command-line tool for Kubernetes has been installed.
3. The [Minikube](https://github.com/kubernetes/minikube/releases) tool for running Kubernetes locally has been installed.
4. The Minikube cluster has been started, inside a local Virtual Machine, using the following command (also includes commands to check that kubectl is configured correctly to see the running minikube pod):


### 1.2 Main Deployment Steps 
1. To start the minikube and docker image for jenkins run the following command ./up_mongodb_minikube.sh
2. To deploy the MongoDB Service (including the StatefulSet running "mongod" containers
    ```
    $ cd scripts
    $ ./generate.sh
    ```

3. Re-run the following command, until all 3 “mongod” pods (and their containers) have been successfully started (“Status=Running”; usually takes a minute or two).

    ```
    $ kubectl get all
    ```

4. Run the login.py test which connects to the first Mongod instance running in a container of the Kubernetes StatefulSet, via the Mongo Shell, to (1) initialise the MongoDB Replica Set, and (2) create a MongoDB admin user.

    ```
    $ cd test-suite/functional-tests
    $ python login.py
    ```
5. Run the data_insertion_test.py test which connects to the first Mongod instance running in a container of the Kubernetes StatefulSet, do some inserts to db and view the data.
 
    ```
    $ python data_insertion_test.py
    ```
6. Run the restart_service.py test which restart the mongodb service and create the pods again and check data still exists.
 
    ```
    $ cd test-suite/performance-tests
    $ python restart_service.py
    ```       
7. Run the replication_test.py test which connects to different replica and validate the data inserted in the first instance
 
    ```
    $ cd test-suite/functional-tests
    $ python replication_test.py
    ```       
You should now have a MongoDB Replica Set initialised, secured and running in a Kubernetes StatefulSet.

You can also view the the state of the deployed environment, via the Kubernetes dashboard, which can be launched in a browser with the following command: 
    
    $ minikube dashboard

        
If you want, you can shutdown the Minikube virtual machine with the following command.
   
    $ minikube stop
  
   