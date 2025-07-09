.PHONY: all clean fclean re down restart
.SILENT:

# **************************************************************************** #
#                                   Variable                                   #
# **************************************************************************** #

NAME	= notflix
DC		= docker compose

# **************************************************************************** #
#                                    Sources                                   #
# **************************************************************************** #

COMPOSE_FILE	= docker-compose.yml

# **************************************************************************** #
#                                     Rules                                    #
# **************************************************************************** #

all: $(NAME)

$(NAME): $(VOLUMES_DIR)
	$(DC) -f $(COMPOSE_FILE) up --build -d

down:
	$(DC) -f $(COMPOSE_FILE) down

restart: down all

clean:
	$(DC) -f $(COMPOSE_FILE) down --volumes --rmi all

fclean: clean
	docker system prune --force --all

# re: fclean all
