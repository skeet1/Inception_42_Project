FROM debian:latest

RUN apt-get update && apt-get install -y nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

# to serv my draft loading page of transcendence
COPY conf/index.html /usr/share/nginx/html/index.html 

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]