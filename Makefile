CRYSTAL := crystal

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
	crystal build src/notify_slack.cr -o bin/notify-slack

test:
	if [ ! -f "WEBHOOK_URL" ]; then \
		touch WEBHOOK_URL; \
	fi
	crystal spec -v
