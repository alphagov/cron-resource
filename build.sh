#!/usr/bin/env bash

set -ex

go mod download

GINKGO_VERSION=$(grep "onsi\/ginkgo" go.mod | awk '{ print $2; }')
GOMEGA_VERSION=$(grep "onsi\/gomega" go.mod | awk '{ print $2; }')

go get "github.com/onsi/ginkgo/ginkgo@${GINKGO_VERSION}"
go get "github.com/onsi/gomega@${GOMEGA_VERSION}"
go install "github.com/onsi/ginkgo/ginkgo@${GINKGO_VERSION}"
ginkgo -r .

mkdir -p tmp/build

go build -o tmp/build/in in/main.go
go build -o tmp/build/check check/check.go
