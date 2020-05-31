pipeline {
    agent any
    environment {
      PATH = "${PATH}:${getTerraformPath()}"
}
    stages {
        stage('S3 - create bucket') {
            steps {
                echo 'Creating bucket'
                script{
                  getTerraformPath('jenkinsterraformbucket1215')
                }
            }
        }
        stage('terraform init and apply -dev') {
            steps {
                echo 'Building dev..'
                sh label: '', returnStatus: true, script: 'terraform workspace new dev'
                sh "terraform init"
                sh "terraform apply -auto-approve -var-file=dev.tfvars"
            }
        }
        stage('terraform init apply and apply -prod') {
            steps {
                echo 'Building Prod..'
                sh returnStatus: true, script: 'terraform workspace new prod'
                sh "terraform init"
                sh "terraform apply -auto-approve -var-file=prod.tfvars"
            }
        }
    }
}

def getTerraformPath(){
  def tfHome = tool name: 'Terraform-12', type: 'terraform'
  return tfHome
}

//Use the Jenkins pipeline Syntax to update tfHome

def createS3Bucket(bucketName){
  sh returnStatus: true, script: "aws create mb bucket-name --region=us-east-1"
}