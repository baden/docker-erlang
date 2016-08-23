DOCKER_IMAGE_NAME := baden-erlang
DOCKER_TAG_NAME := r16b02

# DOCKER_LANG := ru_UA.UTF-8

build:
	@docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_TAG_NAME) .

run:
	@docker run -it --rm $(DOCKER_IMAGE_NAME):$(DOCKER_TAG_NAME)

clean:
	@docker ps -aq -f status=exited | xargs -r docker rm -v
	@docker images -q -f dangling=true | xargs -r docker rmi
	@docker volume ls -q -f dangling=true | xargs -r docker volume rm
