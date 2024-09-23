#Stage-1: Compile and build angular code base 

# use official node image as the base images  
FROM node:latest as build 
# Set working directory 
WORKDIR /usr/local/app  
# Add the source code in app 
COPY ./  /usr/local/app   
# Install angular Dependencies  
RUN npm install       
# Generate the build of the application 
RUN npm run build 


# Stage-2: Deploy app with nginx server (lightweight image)  

FROM nginx:latest 

COPY --from=build  /usr/local/app/dist/angular-ecommerce  /usr/share/nginx/html  

EXPOSE 80

