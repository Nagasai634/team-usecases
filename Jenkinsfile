pipeline{
    agent any
    stages{
        stage("Terraform"){
            steps{
                sh "terraform init"
                sh "terraform plan"
                sh "terraform apply --auto-approve"
            }
        }
    }

}