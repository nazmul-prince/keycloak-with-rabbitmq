# Stage 1: Build the application
FROM maven:3.8.7-eclipse-temurin-8 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and source code to the container
COPY pom.xml ./
COPY src ./src

# Package the application as a fat JAR (including dependencies)
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM openjdk:8-jdk-alpine

# Set the working directory for the runtime
WORKDIR /app

# Copy the built JAR from the previous stage
COPY --from=build /app/target/RabbitMQRecv-1.0-SNAPSHOT-jar-with-dependencies.jar app.jar

# Command to run the JAR
CMD ["java", "-jar", "app.jar"]

