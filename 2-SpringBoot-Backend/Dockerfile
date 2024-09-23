FROM maven:3.6.0-jdk-11-slim as spring-backend  

RUN mkdir /mayur  

WORKDIR /mayur 

COPY  .  . 

RUN mvn clean package -Dmaven.test.skip=true   

FROM openjdk:11-jre-slim 

COPY --from=spring-backend  /mayur/target/spring-boot-ecommerce-0.0.1-SNAPSHOT.jar /usr/app/spring-boot-ecommerce-0.0.1-SNAPSHOT.jar  

EXPOSE 8080  

CMD ["java","-jar","/usr/app/spring-boot-ecommerce-0.0.1-SNAPSHOT.jar"]  


