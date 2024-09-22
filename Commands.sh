sudo yum install npm -y  
#Package manager for Angular framework and other framework   


sudo npm install node -y  
#Angular and many modern JavaScript frameworks (React, Vue.js, etc.) require Node.js to be installed because the Angular CLI (Command Line Interface) and development tools rely on Node.js to run.)
#Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine. It allows you to run JavaScript on the server side and is widely used in building server-side applications, APIs, and full-stack development


sudo npm install -g @angular/cli@14.2.1   
sudo npm install -g @angular/cli                     #latest version 
#installing angular cli with npm package manager 

ng build    # for building the application  

ng clean cache  # cleaning the cache of angular server  

sudo ng serve --host 0.0.0.0 --port=4200   #for starting temporory server 

# building spring-boot application  

sudo apt install maven 

sudo mvn clean package -Dmaven.test.skip=true





# Building Docker images  
ng new demo-app  # for creating new angular application  
# what is dockerfile?  
# Dockerfile is a set of instruction which is given to docker to build a image.   


# Stage-1: Compile and build angular code base 

# use official node image as the base images  
FROM node:latest as build 
# Set working directory 
WORKDIR /usr/local/app  
# Add the source code in app 
COPY ./  /usr/local/app   
# Install all dependencies 
RUN npm install  
# Generate the build of the application 
RUN ng build  


# Stage-2: Deploy app with nginx server (lightweight image)  

FROM nginx:latest 

COPY --from=build  /usr/local/app/dist/angular-ecommerce  /usr/share/nginx/html  

EXPOSE 4200  

