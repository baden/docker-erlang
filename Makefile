DOCKER_IMAGE_NAME := baden-erlang
DOCKER_TAG_NAME := latest

# DOCKER_LANG := ru_UA.UTF-8

build:
	docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_TAG_NAME) .

run:
	docker run -it --rm $(DOCKER_IMAGE_NAME):$(DOCKER_TAG_NAME)
