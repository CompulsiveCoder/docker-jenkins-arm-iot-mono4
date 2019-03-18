pipeline {
    agent any
    stages {
        stage('CleanWS') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout') {
            steps {
                checkout scm
                
                shHide( 'git remote set-url origin https://${GHTOKEN}@github.com/CompulsiveCoder/docker-jenkins-arm-iot-mono4.git' )
                sh "git config --add remote.origin.fetch +refs/heads/master:refs/remotes/origin/master"
                sh "git fetch --no-tags"
                sh 'git checkout $BRANCH_NAME'
                sh 'git pull origin $BRANCH_NAME'
            }
        }
        stage('Build') {
            steps {
                sh 'sh build.sh'
            }
        }
        stage('Tag') {
            steps {
                sh 'sh tag.sh'
            }
        }
        stage('Login') {
            steps {
                shHide( 'sh login.sh ${DOCKERHUB_USERNAME} ${DOCKERHUB_PASSWORD}' )
            }
        }
        stage('Push') {
            steps {
                sh 'sh push.sh'
            }
        }
        stage('Graduate') {
            steps {
                sh 'sh graduate.sh'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
Boolean shouldSkipBuild() {
    return sh( script: 'sh check-ci-skip.sh', returnStatus: true )
}
def shHide(cmd) {
    sh('#!/bin/sh -e\n' + cmd)
}
 
