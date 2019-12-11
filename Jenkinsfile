#!/usr/bin/env groovy

import hudson.model.*
import hudson.EnvVars
import groovy.json.JsonSlurperClassic
import groovy.json.JsonBuilder
import groovy.json.JsonOutput
import java.net.URL
import java.lang.String
import groovy.lang.Closure

pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                echo 'Building...'
                sh '/Mongodb_cluster_on_Minikubes/scripts/generate.sh'
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
                sh '/Mongodb_cluster_on_Minikubes/scripts/delete_service.sh'
            }
        }
    }
}