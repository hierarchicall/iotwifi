IMAGE    ?= hierarchicall/iotwifi
NAME     ?= iotwifi
VERSION  ?= 1.0.4

all: build push

dev: dev_build dev_run

build:
	docker build -t $(IMAGE):latest .
	docker build -t $(IMAGE):arm32v6-$(VERSION) .

push:
	docker build -t $(IMAGE):latest .
	docker build -t $(IMAGE):arm32v6-$(VERSION) .

dev_build:
	docker build -t $(IMAGE) ./dev/

dev_run:
	sudo docker run --rm -it --privileged --network=host \
                   -v $(CURDIR):/go/src/github.com/hierarchicall/iotwifi \
                   -w /go/src/github.com/hierarchicall/iotwifi \
                   --name=$(NAME) $(IMAGE):latest


