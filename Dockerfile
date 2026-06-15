From maven:3.9.4-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
RUN mvn clean install -DskipTests
FROM eclipse-temurin:17-jre
COPY --from=builder /app/target/FoodFrenzy-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","app.jar"]
