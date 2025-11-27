### ---- Stage 1: Build the Spring Boot Application ----
FROM maven:3.9.4-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /app

# Copy Maven project descriptor
COPY pom.xml .

# Download dependencies (cached layer)
RUN mvn -q dependency:go-offline

# Copy source code
COPY src ./src

# Build application (skip tests for faster builds)
RUN mvn -q -DskipTests clean package


### ---- Stage 2: Run the Spring Boot Jar ----
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy the jar from build stage
COPY --from=build /app/target/*.jar app.jar

# Expose backend port
EXPOSE 8081

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
