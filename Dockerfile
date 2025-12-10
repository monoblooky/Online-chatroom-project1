FROM maven:4.0.0-rc-5-eclipse-temurin-25 as build
COPY . .
RUN mvn clean package -DskipTests

FROM jdk-25.0.1
COPY --from=build /target/websocket-demo-0.0.1-SNAPSHOT.jar websocket-demon.jar
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "websocket-demon.jar"]
