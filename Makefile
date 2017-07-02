# build an executable file named helloworld

.PHONY: build run test clean vendor

default: build

build: test
	go build -o ./bin/helloworld ./cmd/helloworld
	#CGO_ENABLED=0 go build -a -installsuffix cgo -o ./bin/helloworld ./cmd/helloworld
	# --ldflags '-linkmode external -extldflags "-static"'
	#CC=$(which musl-gcc) go build --ldflags '-w -linkmode external -extldflags "-static"' -o ./bin/helloworld ./cmd/helloworld

run:
	go run ./cmd/helloworld/main.go

test: vendor

clean:
	rm -Rf ${PWD}/vendor ${PWD}/bin ${PWD}/.glide ${PWD}/glide.lock

vendor: clean
	glide cc
	glide --debug install

