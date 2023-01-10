FROM maven:3.8.4-openjdk-17 AS build
COPY ./ /app
WORKDIR /app
RUN mvn clean package -Dmaven.test.skip=true

FROM openjdk:17
RUN mkdir /app
WORKDIR /app
COPY --from=build ./app/target/config_server-0.0.1-SNAPSHOT.jar /app
EXPOSE 8888
CMD ["java", "-jar", "config_server-0.0.1-SNAPSHOT.jar"]