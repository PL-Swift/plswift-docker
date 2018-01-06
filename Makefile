# Makefile

VERSION = 4.0.3-1

all : swift-pgdev

swift-pgdev:
	docker build \
		-t helje5/swift-pgdev:latest \
		-t helje5/swift-pgdev:$(VERSION) \
	        -f swift-pgdev.dockerfile \
		.

publish:
	docker push helje5/swift-pgdev:latest
	docker push helje5/swift-pgdev:$(VERSION)
