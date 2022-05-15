FROM openjdk:11
ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JAVA_OPTS="" \
    SERVER_PORT=9091 \
    APPLICATION=inner-spring-boot-app
EXPOSE ${SERVER_PORT}
ADD *.jar /${APPLICATION}.jar
CMD java ${JAVA_OPTS} -Dserver.port=${SERVER_PORT} -Djava.security.egd=file:/dev/./urandom -jar /${APPLICATION}.jar