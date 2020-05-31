pipeline {
    agent any
    environment {
      PATH = "${PATH}:${getTerraformPath()}"
}
    stages {
        stage('S3 - create bucket') {
            steps {
                echo 'Creating bucket'
                sh "ansible-playbook s3-bucket.yml"
            }
        }
        stage('terraform init and apply -dev') {
            steps {
                echo 'Building dev..'
                sh label: '', returnStatus: true, script: 'terraform workspace new dev'
                sh "terraform init"
                sh "ansible-playbook terraform.yml"
            }
        }
        stage('terraform init apply and apply -prod') {
            steps {
                echo 'Building Prod..'
                sh returnStatus: true, script: 'terraform workspace new prod'
                sh "terraform init"
                sh "ansible-playbook terraform.yml -e app_env=prod"
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