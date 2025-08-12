pipeline {
    // The agent now specifies that it needs both Docker and Git
    agent {
        docker {
            image 'hashicorp/terraform:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
    }
    tools {
          git 'Default'
        }
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Plan') {
            steps {
                withAWS(credentials: 'aws-credentials', region: 'eu-west-2') {
                    sh 'terraform init'
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input 'Do you want to apply the changes?'
                
                withAWS(credentials: 'aws-credentials', region: 'eu-west-2') {
                    sh 'terraform apply --auto-approve'
                }
            }
        }
    }
}
