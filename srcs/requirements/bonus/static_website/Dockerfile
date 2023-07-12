FROM debian:latest

RUN apt-get update && apt-get install -y nginx 

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY tools/index.html /usr/share/nginx/html/index.html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]