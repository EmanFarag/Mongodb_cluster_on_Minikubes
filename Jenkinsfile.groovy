pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                echo 'Building...'
                sh '/Users/e.abdelaziz/IdeaProjects/Mongodb_cluster_on_Minikubes/scripts/generate.sh'
                echo 'Mongodb built successfully'
            }
        }
        stage('Test') {
             steps {
                 echo 'Testing...'
             }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh '/Users/e.abdelaziz/IdeaProjects/Mongodb_cluster_on_Minikubes/scripts/delete_service.sh'
            }
        }
    }
}