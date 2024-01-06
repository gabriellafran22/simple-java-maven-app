FROM eclipse-temurin:latest
RUN mkdir /app
COPY target/java-app-submission.jar /app
CMD ["java", "-jar", "/app/java-app-submission.jar"]
