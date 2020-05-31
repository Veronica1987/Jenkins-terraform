pipeline {
    agent any
    environment {
      PATH = "${PATH}:${getTerraformPath()}"
}
    stages {
        stage('terraform init') {
            steps {
                echo 'Building..'
                sh "terraform init"
            }
        }
        stage('terraform apply') {
            steps {
                echo 'Building..'
                sh "terraform apply -auto-approve"
            }
        }
    }
}

def getTerraformPath(){
  def tfHome = tool name: 'Terraform-12', type: 'terraform'
  return tfHome
}

//Use the Jenkins pipeline Syntax to update tfHome