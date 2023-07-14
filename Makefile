# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mkarim <mkarim@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/09 06:40:10 by mkarim            #+#    #+#              #
#    Updated: 2023/07/14 20:40:33 by mkarim           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


up:
	@mkdir -p /Users/mkarim/Desktop/data
	@mkdir -p /Users/mkarim/Desktop/data/mariadb_vol
	@mkdir -p /Users/mkarim/Desktop/data/wordpress_vol
	@docker-compose -f ./srcs/docker-compose.yml up --build -d
	@echo "\033[1m\033[32mAll Containers Builded Successfully!"

down:
	@docker-compose -f ./srcs/docker-compose.yml down -v
	@echo "\033[1m\033[31mAll Containers Downed Successfully!"

clean:
	@rm -rf /Users/mkarim/Desktop/data
	# @if [ -z "$$(docker ps -qa)" ]; then \
	# 	echo "\033[1m\033[31mNO CONTAINERS TO REMOVE\033[1m"; \
	# else \
	# 	docker rm -f $$(docker ps -qa); \
	# 	echo "\033[1m\033[32mAll Containers removed Successfully!"; \
	# fi
	# @if [ -z "$$(docker images -q)" ]; then \
	# 	echo "\033[1m\033[31mNO IMAGES TO REMOVE\033[1m"; \
	# else \
	# 	docker rmi -f $$(docker images -qa); \
	# 	echo "\033[1m\033[32mAll Images removed Successfully!"; \
	# fi

re: down clean up

prune:
	@docker system prune --all --force
	@echo "\033[1m\033[31mCACHE REMOVED\033[1m"