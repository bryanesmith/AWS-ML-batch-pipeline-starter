pipeline {

  // TODO: Docker agent
  agent any

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
