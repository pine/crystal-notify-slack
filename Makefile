CRYSTAL := crystal

VERSION := $(shell cat VERSION)
OS      := $(shell uname -s | tr '[:upper:]' '[:lower:]')
ARCH    := $(shell uname -m)

ifeq ($(OS),linux)
	CRFLAGS := --link-flags "-static -L$(shell crenv prefix)/embedded/lib"
endif

ifeq ($(OS),darwin)
	CRFLAGS := --link-flags "-L."
endif

.PHONY: default all build

default: all
all: deps build test

clean:
	rm -rf .crystal
	rm -rf .shards
	rm -rf libs

deps:
	shards install

build:
	$(CRYSTAL) build src/notify_slack.cr -o bin/notify-slack

test:
	$(CRYSTAL) spec -v

release:
	$(CRYSTAL) build --release $(CRFLAGS) src/notify_slack.cr -o bin/notify-slack
	cd bin && tar cvfz notify-slack_$(VERSION)_$(OS)_$(ARCH).tar.gz notify-slack
