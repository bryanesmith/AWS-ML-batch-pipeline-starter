pipeline {

  agent {
    docker { image 'hashicorp/terraform' }
  }

  stages {

    stage('Configuration') {
      def dockerHome = tool 'MasterDocker'
      env.PATH = "${dockerHome}:${env.PATH}"
      steps {
        sh 'echo $PATH'
      }
    }

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
