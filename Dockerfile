 FROM amazoncorretto:20
 COPY target/megachat-0.0.1-SNAPSHOT.jar megachat-1.0.0.jar
 EXPOSE 8081
 ENTRYPOINT ["java","-jar","/megachat-1.0.0.jar"]

