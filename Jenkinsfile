pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                // This will check out the code from the Git repository
                // configured in the Jenkins job
                checkout scm
            }
        }

        stage('Terraform Plan') {
            steps {
                // Use the 'aws-credentials' ID we created in Jenkins
                withAWS(credentials: 'aws-credentials', region: 'eu-west-2') {
                    sh 'terraform init'
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                // Add a manual approval step before applying changes
                input 'Do you want to apply the changes?'
                
                withAWS(credentials: 'aws-credentials', region: 'eu-west-2') {
                    sh 'terraform apply --auto-approve'
                }
            }
        }
    }
}
