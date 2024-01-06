FROM eclipse-temurin:latest
RUN mkdir /app
COPY target/java-app-submission.jar /app/java-app-submission.jar
CMD ["java", "-jar", "/app/java-app-submission.jar"]
