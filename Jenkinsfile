pipeline {
    agent any

    parameters {
        choice(
            name: 'ACTION',
            choices: ['apply', 'destroy'],
            description: 'Select what Terraform should do'
        )
    }

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account')
    }

    stages {
        stage('checkout SCM'){
            steps{
                cleanWs() 
               sh "git clone https://github.com/Nagasai634/team-usecases.git"
            }
        }
        stage('Terraform Init') {
            steps {
                dir("/var/lib/jenkins/workspace/new-job") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Action') {
            when {
                expression { params.ACTION == 'apply' }
            }
            steps {
                dir("/var/lib/jenkins/workspace/new-job") {
                    sh 'terraform plan'
                    sh 'terraform apply --auto-approve'
                }
            }
        }

        stage('Terraform Destroy') {
            when {
                expression { params.ACTION == 'destroy' }
            }
            steps {
                dir("/var/lib/jenkins/workspace/new-job") {
                    sh 'terraform destroy --auto-approve'
                }
            }
        }
    }
}
