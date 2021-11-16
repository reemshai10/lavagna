<<<<<<< HEAD
FROM maven:3.8.3-jdk-8 
=======
FROM maven:3.6.1-jdk-8 as Builder

WORKDIR /app/
>>>>>>> reem

COPY ./pom.xml ./pom.xml
COPY ./LICENSE-GPLv3.txt ./LICENSE-GPLv3.txt
<<<<<<< HEAD
RUN mvn verify 





COPY ./entrypoint.sh ./entrypoint.sh
=======
COPY ./src/ ./src/

RUN mvn verify
>>>>>>> reem


FROM openjdk:8-jdk-alpine

WORKDIR /app/
COPY --from=Builder /app/target/ ./target/

COPY ./entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

ENV DB_DIALECT 'MYSQL'
ENV DB_URL 'jdbc:mysql://mysql:3306/lavagna'
ENV DB_USER 'root'
ENV DB_PASS 'root'
ENV SPRING_PROFILE 'dev' 

ENTRYPOINT ["./entrypoint.sh"]
