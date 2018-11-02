pipeline {
    agent any
    triggers {
        pollSCM 'H/2 * * * *'
    }
    stages {
        stage('Login') {
            steps {
                sh 'sh login.sh'
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
        stage('Push') {
            steps {
                sh 'sh push.sh'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
