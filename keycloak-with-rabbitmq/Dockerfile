# Stage 1: Build the application
FROM maven:3.8.4-eclipse-temurin-17 as builder

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and source code to the container
COPY pom.xml ./
COPY . ./

# Package the application as a fat JAR (including dependencies)
RUN mvn clean install

FROM quay.io/keycloak/keycloak:22.0.4

WORKDIR /opt/keycloak/providers
# Copy the built JAR from the previous stage
COPY --from=builder /app/target/keycloak.rabbitmq-v1.0.1.jar keycloak.rabbitmq-v1.0.1.jar
COPY --from=builder /app/jars/amqp-client-5.16.0.jar amqp-client-5.16.0.jar
COPY --from=builder /app/jars/slf4j-api-1.7.36.jar slf4j-api-1.7.36.jar
COPY --from=builder /app/jars/slf4j-simple-1.7.36.jar slf4j-simple-1.7.36.jar

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
