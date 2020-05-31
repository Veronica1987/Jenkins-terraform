pipeline {
    agent any
    environment {
      PATH = "${PATH}:${getTerraformPath()}"
}
    stages {
        stage('terraform init and apply -dev') {
            steps {
                echo 'Building dev..'
                sh sh label: '', returnStatus: true, script: 'terraform workspace new dev'
                sh "terraform init"
                sh "terraform apply -auto-approve -var-file=dev.tfvars"
            }
        }
        stage('terraform init apply and apply -prod') {
            steps {
                echo 'Building Prod..'
                sh label: '', returnStatus: true, script: 'terraform workspace new prod'
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