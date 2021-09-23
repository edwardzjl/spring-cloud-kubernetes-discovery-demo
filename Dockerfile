FROM openjdk:11-jdk-slim as build
COPY . /build/
WORKDIR /build
RUN ./mvnw clean package -Dmaven.test.skip

FROM openjdk:11-jdk-slim
COPY --from=build /build/target/demo-0.0.1-SNAPSHOT.jar /app/app.jar
ENTRYPOINT exec java -jar $JAVA_OPTS /app/app.jar
