import os
import time


def recreate_service():
    os.system("sh ../../scripts/undeploy_service.sh")
    time.sleep(10)
    os.chdir("/Users/e.abdelaziz/IdeaProjects/Mongodb_cluster_on_Minikubes/scripts")
    os.system("sh recreate_service.sh")
    time.sleep(10)
    os.system("sh ../scripts/check_data.sh 0")



recreate_service()