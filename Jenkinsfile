pipeline {
    agent any

    environments {
        ENV="${env.BRANCH_NAME}"
        TF_WORKDIR="Environments/${env.BRANCH_NAME}"
    }

    stages {
        stage ('checkout') {
            steps {
                gitbranch: ${env.BRANCH_NAME},
                url:'https://github.com/Gokulraja2004/infra12.git'
            }
        }

        stage ('terraform init') {
            steps {
                dir("${TF_WORKDIR}")
                sh 'terraform init'
            }
        }

        stage ('terraform plan') {
            steps {
                dir("${TF_WORKDIR}")
                sh 'terraform plan -out=tfplan'
                sh 'terraform show -no-color tfplan > tfplan.txt'
                sh 'cat tfplan.txt'
            }
        }
        stage ('approval') {
            steps {
                input message : "Approve deployment or production?": ok "deploy"
            }
        }
        stage('apply') {
            steps {
                dir("${TF_WORKDIR}")
                sh "terraform apply -auto-approve tfplan"
            }
        }
    }
}