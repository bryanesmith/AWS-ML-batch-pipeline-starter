pipeline {

  agent {
    docker { image 'hashicorp/terraform' }
  }

  stages {
    // - - - - - - - - - - - - - - - - - - - - - - - - - - -
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    // - - - - - - - - - - - - - - - - - - - - - - - - - - -
    stage('Provision Storage') {
      steps {
        sh '''
          echo "Testing #3"
          terraform -v
        '''
      }
    }
  }
}
