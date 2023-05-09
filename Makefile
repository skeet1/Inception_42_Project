# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mkarim <mkarim@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/09 06:40:10 by mkarim            #+#    #+#              #
#    Updated: 2023/05/09 06:43:17 by mkarim           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

NGINX_PATH = ./src/requirements/nginx

MARIADB_PATH = ./src/requirements/mariadb

WORDPRESS_PATH = ./src/requirements/wordpress

all :
	docker build -d nginx-image $(NGINX_PATH)
	docker build -d mariadb-image $(MARIADB_PATH)
	docker build -d wordpress-image $(WORDPRESS_PATH)


