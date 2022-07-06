#FROM registry.access.redhat.com/ubi8/openjdk-11:1.13-1.1655306377
FROM quay.io/devfile/maven:3.8.1-openjdk-17-slim

WORKDIR /build

# Build dependency offline to streamline build
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src src
RUN mvn package -Dmaven.test.skip=true

FROM registry.access.redhat.com/ubi8/openjdk-8-runtime:1.13-1.1655306436
COPY --from=0 /build/target/SPTestMicroservice-0.0.1-SNAPSHOT.jar /app/target/SPTestMicroservice-0.0.1-SNAPSHOT.jar

EXPOSE 8080

#COPY target/SPTestMicroservice-0.0.1-SNAPSHOT.jar SPTestMicroservice-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/app/target/SPTestMicroservice-0.0.1-SNAPSHOT.jar", "--server.port=8080" ]