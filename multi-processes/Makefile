
export PKG_CONFIG_PATH=/opt/rocksdb/lib/pkgconfig

ldflags :=  -lpthread -lrt -ldl -lsnappy -lgflags -lz -lbz2 -llz4 -lzstd

.PHONY: all
all: app

app: main.cc
	@mkdir -p build
	@g++ main.cc -o build/$@ `pkg-config --cflags --libs rocksdb` $(ldflags)

run-primary: app
	@build/$^ 0

run-secondary: app
	@build/$^ 1

.PHONY: clean
clean:
	@rm -rf build
