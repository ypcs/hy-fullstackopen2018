IMAGE = ypcs/misc:mooc-hy-fullstackopen2018

all:

build:
	docker build -t $(IMAGE) .

shell:
	docker run -it -v $(shell pwd):/home/user/src $(IMAGE)
