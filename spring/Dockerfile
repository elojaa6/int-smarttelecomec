FROM openjdk:17.0.1-jdk-slim
ARG JAR_FILE=./BackendSmartTelecom-0.0.1-SNAPSHOT.war
COPY ${JAR_FILE} /proyecto/app.war
EXPOSE 8060
CMD ["/bin/bash", "-c", "#(nop) ", "CMD [\"/bin/bash\"]"]
ENTRYPOINT ["java", "-jar", "/proyecto/app.war"]
