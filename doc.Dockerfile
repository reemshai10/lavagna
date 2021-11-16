
FROM maven:3.6.1-jdk-8 as base
WORKDIR /doc

COPY ./pom.xml ./pom.xml
COPY ./src/main/stampo ./src/main/stampo
COPY ./target ./target
RUN mvn clean stampo:build

ENTRYPOINT [ "mvn", "stampo:serve" ]

# FROM nginx:1.21-alpine

# WORKDIR /usr/share/nginx/static/

# COPY --from=base /doc/target/ ./

# # COPY --from=base /etc/nginx/nginx.conf /etc/nginx/


