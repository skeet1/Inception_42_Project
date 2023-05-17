FROM debian:latest

RUN apt-get update && apt-get install -y nginx openssl

# copy Nginx configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY tools/index.html /usr/share/nginx/html/index.html

COPY ./tools/install_tools.sh .

RUN chmod +x install_tools.sh

ENTRYPOINT ["./install_tools.sh"]

EXPOSE 443 8080

CMD ["nginx", "-g", "daemon off;"]
