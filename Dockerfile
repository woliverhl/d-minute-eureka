FROM openjdk:8-jdk-alpine
# Add Maintainer Info
LABEL maintainer="ohidalgoleal@gmail.com"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8001 available to the world outside this container
EXPOSE 8002

# Fix zona horaria de Chile
#RUN apk update && apk install -y tzdata
#ENV TZ America/Santiago

ENV CONFIG_SERVER_DMINUTE=https://dminute-config-server.herokuapp.com/

# The application's jar file
ARG JAR_FILE=target/d-minute-eureka-1.0.0.jar

# Add the application's jar to the container
ADD ${JAR_FILE} d-minute-eureka.jar

# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/d-minute-eureka.jar"]