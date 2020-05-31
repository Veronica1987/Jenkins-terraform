pipeline {
    agent any
    environment {
      PATH = "${PATH}:${getTerraformPath()}"
}
    stages {
        stage('terraform destroy') {
            steps {
                echo 'Building..'
                sh "terraform destroy -auto-approve"
            }
        }
    }
}

def getTerraformPath(){
  def tfHome = tool name: 'Terraform-12', type: 'terraform'
  return tfHome
}

//Use the Jenkins pipeline Syntax to update tfHome