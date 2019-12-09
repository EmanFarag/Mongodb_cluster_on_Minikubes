pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                echo 'Building...'
                sh '/Users/e.abdelaziz/IdeaProjects/Mongodb_cluster_on_Minikubes/up_mongodb_minikube'
                echo 'Mongodb built successfully'
            }
        }
        stage('Test') {
             steps {
                 echo 'Testing...'
                 sh 'python --version'
             }
        }
        stage('Deploy') {
            steps {
                echo 'Testing...'
                sh 'python --version'
            }
        }
    }
}