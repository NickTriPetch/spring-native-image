# First stage: Build the native executable using GraalVM
FROM ghcr.io/graalvm/graalvm-ce:22.3.1 AS build

WORKDIR /usr/src/app

# Copy project files
COPY . .

# Ensure Gradle wrapper is executable
RUN chmod +x gradlew

# Build the native image
RUN ./gradlew nativeCompile --no-daemon

# Second stage: Lightweight runtime image
FROM debian:bookworm-slim

WORKDIR /app

# Copy the native binary from the build stage
COPY --from=build /usr/src/app/build/native/nativeCompile/spring-native-image /app/spring-native-image

# Expose port if needed
EXPOSE 8080

# Run the native application
CMD ["/app/spring-native-image"]