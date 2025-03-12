# Use an official OpenJDK runtime as a parent image
FROM openjdk:23-slim

# Set the working directory
WORKDIR /benchbase

# Install necessary packages
RUN apt-get update && apt-get install -y git maven && rm -rf /var/lib/apt/lists/*

# Clone the BenchBase repository
RUN git config --global http.postBuffer 524288000 && \
    git config --global http.lowSpeedLimit 0 && \
    git config --global http.lowSpeedTime 999999 && \
    git clone --depth=1 https://github.com/cmu-db/benchbase.git .

# Build the project for the YugabyteDB profile
RUN ./mvnw clean package -P postgres

# Set the working directory to the built package
WORKDIR /benchbase/target/benchbase-postgres

ENTRYPOINT ["tail", "-f", "/dev/null"]

# Default command to run BenchBase
# CMD ["java", "-jar", "benchbase-2023-SNAPSHOT-postgres.jar", "-b", "ycsb", "-c", "benchbase/config/yugabyte_config.xml","--config","benchbase/config/yugabyte_config.xml", "--create=true", "--load=true", "--execute=true"]
