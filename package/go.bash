#!/bin/bash

go get -u -v github.com/alecthomas/gometalinter
gometalinter --install --update

go get -u -v github.com/cweill/gotests/...
go get -u -v github.com/derekparker/delve/cmd/dlv
go get -u -v github.com/elazarl/go-bindata-assetfs/...
go get -u -v github.com/fatih/gomodifytags
go get -u -v github.com/golang/dep/cmd/dep
go get -u -v github.com/josharian/impl
go get -u -v github.com/jteeuwen/go-bindata/...
go get -u -v github.com/k0kubun/pp
go get -u -v github.com/lukehoban/go-find-references
go get -u -v github.com/lukehoban/go-outline
go get -u -v github.com/mattn/files
go get -u -v github.com/mattn/goemon/cmd/goemon
go get -u -v github.com/mattn/jvgrep
go get -u -v github.com/motemen/ghq
go get -u -v github.com/motemen/gore
go get -u -v github.com/mvdan/unparam
go get -u -v github.com/newhook/go-symbols
go get -u -v github.com/nsf/gocode
go get -u -v github.com/pwaller/goimports-update-ignore
go get -u -v github.com/ramya-rao-a/go-outline
go get -u -v github.com/rogpeppe/godef
go get -u -v github.com/tpng/gopkgs
go get -u -v golang.org/x/tools/cmd/godoc
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/oracle
go get -u -v golang.org/x/tools/cmd/stringer
go get -u -v sourcegraph.com/sqs/goreturns
