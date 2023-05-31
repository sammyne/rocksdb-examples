#!/bin/bash

repo_tag=sammyne/rocksdb-examples:8.1.1

docker run -it --rm --name rocksdb-examples -v $PWD:/workspace -w /workspace $repo_tag bash
