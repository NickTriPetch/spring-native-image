# First stage: Build the native executable using GraalVM
FROM ghcr.io/graalvm/jdk-community:17.0.9-ol9-20231024 AS build

# Install required dependencies for native-image
RUN microdnf update -y && \
    microdnf install -y findutils gcc glibc-devel zlib-devel libstdc++-devel gcc-c++ && \
    microdnf clean all

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