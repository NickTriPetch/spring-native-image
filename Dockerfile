
FROM arm64v8/alpine


# Set the working directory
WORKDIR /app

# Copy the executable
COPY /build/native/nativeCompile/spring-native-image /app/

# Make the file executable
RUN chmod +x /app/spring-native-image

# Define the entry point
ENTRYPOINT ["/app/spring-native-image"]