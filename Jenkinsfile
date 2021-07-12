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
      
    }
}
