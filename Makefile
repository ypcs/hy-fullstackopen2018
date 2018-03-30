IMAGE = ypcs/mooc:hy-fullstack

all:

build:
	docker build -t $(IMAGE) .

shell:
	docker run -it -v $(shell pwd):/home/user/src $(IMAGE)
