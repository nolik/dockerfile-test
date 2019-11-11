FROM azul/zulu-openjdk-alpine:11


# Add Maven dependencies (not shaded into the artifact; Docker-cached)
# Add the service itself
#ARG JAR_FILE
#ADD target/${JAR_FILE} /app.jar


#RUN echo $JAR_FILE
#
#CMD [ "-jar", "/app.jar" ]
#ENTRYPOINT [ "java" ]
#EXPOSE 8080

VOLUME /tmp
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.example.dockerfiletest.DockerfileTestApplication"]