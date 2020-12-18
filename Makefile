REGISTRY              := gcr.io/pingcap-public/gardener
EXECUTABLE            := dns-controller-manager
PROJECT               := github.com/gardener/external-dns-management
IMAGE_REPOSITORY      := $(REGISTRY)/dns-controller-manager
VERSION               := $(shell cat VERSION)
IMAGE_TAG             := $(VERSION)

.PHONY: revendor
revendor:
	@GO111MODULE=on go mod vendor
	@GO111MODULE=on go mod tidy


.PHONY: check
check:
	@.ci/check

.PHONY: build
build:
	@CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GO111MODULE=on go build -o $(EXECUTABLE) \
	    -mod=vendor \
	    -ldflags "-X main.Version=$(VERSION)-$(shell git rev-parse HEAD)"\
	    ./cmd/dns

.PHONY: build-local
build-local:
	@CGO_ENABLED=0 GO111MODULE=on go build -o $(EXECUTABLE) \
	    -mod=vendor \
	    -ldflags "-X main.Version=$(VERSION)-$(shell git rev-parse HEAD)"\
	    ./cmd/dns

.PHONY: release
release:
	@CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GO111MODULE=on go build -o $(EXECUTABLE) \
	    -a \
	    -mod=vendor \
	    -ldflags "-w -X main.Version=$(VERSION)" \
	    ./cmd/dns

.PHONY: test
test:
	GO111MODULE=on go test -mod=vendor ./pkg/...
	@echo ----- Skipping long running integration tests, use \'make alltests\' to run all tests -----
	test/integration/run.sh $(kindargs) -- -skip Many $(args)

.PHONY: generate
generate:
	@./hack/generate-code

alltests:
	GO111MODULE=on go test -mod=vendor ./pkg/...
	test/integration/run.sh $(kindargs) -- $(args)

.PHONY: docker-images
docker-images: build
	@docker build -t $(IMAGE_REPOSITORY):$(IMAGE_TAG) -f build/Dockerfile .

