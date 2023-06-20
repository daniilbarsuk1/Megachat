FROM maven:3.8.5-openjdk-17 AS maven_build

COPY pom.xml /build/
COPY src /build/src/

WORKDIR /build/
RUN mvn package

FROM openjdk:17-jdk

WORKDIR /app
COPY --from=maven_build /build/target/megachat-1.0.0.jar /app/
ENTRYPOINT ["java","-jar","megachat-1.0.0.jar"]
EXPOSE 8081