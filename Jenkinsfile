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
	    archiveArtifacts 'target/my-app-1.0-SNAPSHOT.jar'
	    docker.build("java-app:latest");
	    sh 'docker run --rm java-app'
            sleep 60
    }
}
