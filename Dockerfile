FROM maven:3.8-openjdk-8

WORKDIR /app
COPY ./pom.xml ./pom.xml
COPY ./src/ ./src/
COPY ./LICENSE-GPLv3.txt ./LICENSE-GPLv3.txt
RUN mvn verify 
COPY ./entrypoint.sh ./entrypoint.sh


ENV DB_DIALECT 'MYSQL'
ENV DB_URL 'jdbc:mysql://mysql:3306/lavagna'
ENV DB_USER 'root'
ENV DB_PASS 'root'
ENV SPRING_PROFILE 'dev'

RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
