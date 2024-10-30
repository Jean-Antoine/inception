SRCS =	srcs/requirements/mariadb/dockerfile\
		srcs/requirements/nginx/dockerfile\
		srcs/requirements/wordpress/dockerfile

all:		up

hard-up:
			docker compose -f ./srcs/docker-compose.yml up --force-recreate

up:
			docker compose -f ./srcs/docker-compose.yml up -d --build

down:
			docker compose -f ./srcs/docker-compose.yml down 

stop:
			docker compose -f ./srcs/docker-compose.yml stop