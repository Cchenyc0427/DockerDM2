
FROM openjdk:17

COPY ./build/libs/HelloWorld-0.0.1-SNAPSHOT.jar /app.jar

ENTRYPOINT ["java","-Xms256m","-Xmx512m","-jar","app.jar"]

