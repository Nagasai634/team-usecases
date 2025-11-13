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
                cleanws()
               sh "git clone https://github.com/Nagasai634/team-usecases.git"
            }
        }
        stage('Terraform Init') {
            steps {
                dir("/home/saivardhan63") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Action') {
            when {
                expression { params.ACTION == 'apply' }
            }
            steps {
                dir("/home/saivardhan63") {
                    sh 'terraform plan'
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Terraform Destroy') {
            when {
                expression { params.ACTION == 'destroy' }
            }
            steps {
                dir("/home/saivardhan63") {
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }
}