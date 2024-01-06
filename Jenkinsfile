node {
    checkout scm
    stage('Build') {
        docker.image('maven:3.8.6-eclipse-temurin-18-alpine').inside('-v /root/.m2:/root/.m2') {
                sh 'mvn -B -DskipTests clean package'
        }
    }
    stage('Test') {
        try {
                docker.image('maven:3.8.6-eclipse-temurin-18-alpine').inside('-v /root/.m2:/root/.m2') {
                        sh 'mvn test'
                }
        } catch (e) {
                echo "Test Stage Failed!"
        } finally {
                junit 'target/surefire-reports/*.xml'
        }
    }
    stage('Manual Approval'){
	    input message: 'Approval dibutuhkan, Deploy app?', ok: 'Proceed'
    }
    stage('Deploy') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
    }
//    stage('Deploy') {
//	    archiveArtifacts 'target/java-app-submission.jar'
//	    docker.build("java-app:latest");
//	    sh "ssh-keyscan -H 52.221.236.171 >> ~/.ssh/known_hosts"
//	    sh "/usr/bin/scp -i /home/capernaum_gabriella/final-dicoding-submission.pem /home/capernaum_gabriella/first-submission/simple-java-maven-app/target/java-app-submission.jar  ubuntu@52.221.236.171:/home/ubuntu/java-app-submission.jar"
//	    sh 'docker run --rm java-app'
//	    sleep 60
//    }
}
