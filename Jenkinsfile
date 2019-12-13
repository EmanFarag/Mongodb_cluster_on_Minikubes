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
                sh 'scripts/build.sh'
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
                sh 'scripts/undeploy_service.sh'
            }
        }
    }
}