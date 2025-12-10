FROM maven:4.0.0-rc-5-eclipse-temurin-25 AS build
COPY . .

RUN mvn clean package -DskipTests

FROM eclipse-temurin:25-jdk
COPY --from=build /target/websocket_demo-0.0.1-SNAPSHOT.jar websocket_demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "websocket_demo.jar"]




