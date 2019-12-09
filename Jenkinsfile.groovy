pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                echo 'Building...'
                sh '/Users/e.abdelaziz/IdeaProjects/Mongodb_cluster_on_Kubernetes/scripts/generate'
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