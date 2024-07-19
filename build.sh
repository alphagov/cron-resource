#!/usr/bin/env bash

set -ex

go mod download

GINKGO_VERSION=$(grep "onsi\/ginkgo" go.mod | awk '{ print $2; }')
GOMEGA_VERSION=$(grep "onsi\/gomega" go.mod | awk '{ print $2; }')

go get "github.com/onsi/ginkgo/v2@${GINKGO_VERSION}"
go get "github.com/onsi/gomega@${GOMEGA_VERSION}"
go install -mod=mod "github.com/onsi/ginkgo/v2/ginkgo@${GINKGO_VERSION}"
ginkgo -r .

mkdir -p tmp/build

CGO_ENABLED=0 GOOS=linux go build -o tmp/build/in in/main.go
CGO_ENABLED=0 GOOS=linux go build -o tmp/build/check check/check.go
