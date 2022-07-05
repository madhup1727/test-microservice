#FROM registry.access.redhat.com/ubi8/openjdk-11:1.13-1.1655306377
FROM registry.access.redhat.com/ubi8/openjdk-8-runtime:1.13-1.1655306436
MAINTAINER sellerportal
COPY target/SPTestMicroservice-0.0.1-SNAPSHOT.jar SPTestMicroservice-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","SPTestMicroservice-0.0.1-SNAPSHOT.jar"]