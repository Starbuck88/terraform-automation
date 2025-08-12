pipeline {
    agent {
        docker {
            image 'my-jenkins-tf'
            args '-v /var/run/docker.sock:/var/run/docker.sock -u root'
        }
    }

    // The tools block is now at the same level as the agent block
    tools {
        git 'Default'
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
