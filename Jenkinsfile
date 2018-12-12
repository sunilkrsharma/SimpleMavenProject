pipeline {
    agent any
    stages {
        stage('CodeCheckOut') {
            steps {
                script {
                    checkout scm
                    def mvnHome = tool 'maven-3'
                }
            }
        }
		stage('User Input') {
			steps {
			input ('Do you want to proceed?')
			}
		}
        stage('Build Customer app code') {
            steps {
                script {

                    def JAVA_HOME  = tool 'JAVA_1.8'
                    checkout scm
                    def mvnHome = tool 'maven-3'
                    try {
                        sh "mvn clean install -U -Dmaven.test.skip=true"
                        currentBuild.result = 'SUCCESS'
                    } catch (Exception err) {
                        currentBuild.result = 'FAILURE'
                        sh "exit 1"
                    }
                    echo "RESULT: ${currentBuild.result}"
                }
            }
        }

		/*stage('Testing'){
			parallel {
				stage ('Unit Testing'){
					steps {
						script {
							echo "Unit Testing"
							}
					}
				}
				stage('Automated Test') {
					steps {
						script {
							sshagent(credentials: ['RemoteCredentials']) {
								 def JAVA_HOME  = tool 'JAVA_1.8'
								def mvnHome = tool 'maven-3'
								try {
									sh "mvn test"
									stash 'working-copy'
									currentBuild.result = 'SUCCESS'
									} catch (Exception err) {
										currentBuild.result = 'FAILURE'
										sh "exit 1"
									}
								echo "RESULT: ${currentBuild.result}"
									}
								}
							}
						}
					}
				}*/

		}   
}
