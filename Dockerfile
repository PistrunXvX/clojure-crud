FROM openjdk:8-alpine

COPY target/uberjar/crud.jar /crud/app.jar

EXPOSE 3000

CMD ["java", "-jar", "/crud/app.jar"]
