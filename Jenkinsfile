pipeline {

  /*
  agent {
    docker { image 'hashicorp/terraform' }
  }
  */
  agent any

  stages {

    // - - - - - - - - - - - - - - - - - - - - - - - - - - -
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    // - - - - - - - - - - - - - - - - - - - - - - - - - - -
    stage('Configuration') {
      steps {
        sh 'echo "DEBUG:"'
        sh 'echo $PATH'
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
