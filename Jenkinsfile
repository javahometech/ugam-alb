pipeline{
    agent any
    tools {
      terraform 'terraform-exe'
    }

    stages{
        stage("Git Checkout"){
            steps{
                git 'https://github.com/javahometech/ugam-alb'
            }
        }
        
        stage("Terraform init"){
            steps{
                sh "terraform init"
            }
        }
        
        stage("Terraform Dev"){
            steps{
                     sh "terraform apply -auto-approve"
                }
        }
        
        stage("Terraform Dev"){
            steps{
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-creds-uat', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                     sh "terraform apply -auto-approve"
                }
            }
        }
        
        stage("Terraform Prod"){
            steps{
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-creds-prod', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                     sh "terraform apply -auto-approve"
                }
            }
        }
      
    }
}
