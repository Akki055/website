pipeline {
    agent none
    environment {
        DOCKERHUB_CREDENTIALS = credentials("f40f3f1d-4b6a-4f4e-a7b5-be4b01c8341b")
    }
    stages {
        stage('git') {
            agent {
                label "K8-master"
            }
            steps {
                script {
                    git 'https://github.com/Akki055/website.git'
                }
            }
        }
        stage('docker') {
            agent {
                label "K8-master"
            }
            steps {
                script {
                    sh 'sudo docker build /home/ubuntu/jenkins/workspace/Proj/ -t akki058/proj2'
                    sh 'sudo docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}'
                    sh 'sudo docker push akki058/proj2'
                }
            }
        }
         stage('kubernetes') {
            agent {
                label "K8-master"
            }
            steps {
                script {
                    sh 'kubectl delete deploy nginx-deployment'
                    sh 'kubectl apply -f deployment.yaml'
                    sh 'kubectl delete service my-service'
                    sh 'kubectl apply -f service.yaml'
                }
            }
        }
    }
}
