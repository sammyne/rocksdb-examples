#!/bin/bash

repo=sammyne/rocksdb-examples

rocksdb_tag=v8.1.1

repo_tag=$repo:${rocksdb_tag##v}

docker build --build-arg ROCKSDB_REV=$rocksdb_tag -t $repo_tag .
